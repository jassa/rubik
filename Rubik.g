grammar Rubik;

options {
    language = Ruby;
    output = AST;
}

tokens {
    AND='&&';
    ASGN='=';
    BLOCK;
    BREAK='break';
    CHANGE_COLOR='change_color';
    CHANGE_DIR='change_direction';
    COMMA=',';
    DEF='def';
    DIV='/';
    DO='do';
    DOT='.';
    DRAW_CIRCLE='draw_circle';
    DRAW_SQUARE='draw_square';
    DRAW_RECTANGLE='draw_rectangle';
    ELSE='else';
    EQ='==';
    GEQ='>=';
    GREATER='>';
    IF='if';
    LBRACE='{';
    LBRAK='[';
    LEQ='<=';
    LESS='<';
    LPAREN='(';
    LPAREN='(';
    MINUS='-';
    NEG='!';
    NEQ='!=';
    NULL='null';
    OR='||';
    PEN_DOWN='pen_down';
    PEN_UP='pen_up';
    PLUS='+';
    RBRACE='}';
    RBRAK=']';
    RPAREN=')';
    RPAREN=')';
    R_BEGIN='begin';
    R_END='end';
    R_MOVE='move';
    R_RESET='reset';
    R_RETURN='return';
    SEMI=';';
    STAR='*';
    TIMES='times';
    TLK='talk';
}

@parser::init {
    @inserta_fin = 0
    @check_bool = nil
    @symbols = {}
    @functions = {}
    @constants = {}
    @quadruples = []
    @current_scope = '_'
    @pila_tipos = []
    @pila_operadores = []
    @pila_operandos = []
    @pila_saltos = []
    @saltos = 0
    @cont_int = 0
    @cont_string = 0
    @cont_float = 0
    @cont_boolean = 0
    @aux_times = 0

    require 'cubo_semantico'
    require 'cuadruplos'
}

// Top-level structure

program
    : { goto_main } block* 'begin' statement_end! { fill_main }
        block+ 'end' statement_end!
    ;

block
    : statement
    | statement_block
    ;

statement_block
    : '{' statement* '}'
    ;

// Statements

statement
    : robot_statement
    | variable_statement
    | assignment_statement
    | condition_statement
    | write_statement
    | read_statement
    | loop_statement
    | return_statement
    | function
    | functions statement_end!
    ;

statement_end
    : ';'
    | ( '}' )=>
    | EOF
    ;

robot_statement
    : robot statement_end!
    ;

return_statement
    : 'return' expression { return_expression } statement_end!
    ;

variable_statement
@after {
    @current_var_type = nil
}
    : VAR_TYPE { @current_var_type = $VAR_TYPE.text } variable_declaration_list statement_end!
    ;

variable_declaration_list
    : variable_declaration (',' variable_declaration)*
    ;

variable_declaration
    : declaration_target ('=' expression)?
    ;

declaration_target
    : variable_name ('[' INT ']')? { define_variable($variable_name.text, @current_var_type, ($INT.nil? ? 1 : $INT.text)) }
    ;

assignment_statement
    : variable_name ('[' exp ']')? { assign($variable_name.text, $exp.text) } '=' { exp2('=') } expression { exp9 } statement_end!
    ;

condition_statement
    : 'if' '(' expression ')'{ if1 } block ({ if2 } 'else' block)? {if3}
    ;

expression
    : exp (relation_op { exp2(input.look(-1).text) } exp { exp9 })?
    ;

relation_op
    : '<'
    | '>'
    | '<='
    | '>='
    | '=='
    | '!='
    ;

exp
    : term { exp4 } (('+'|'-') { exp2(input.look(-1).text) } exp)?
    ;

term
    : factor { exp5 } (('*'|'/') { exp2(input.look(-1).text) } term)?
    ;

factor
    : '(' { exp6 } expression ')' { exp7 }
    | '-'? primary
    ;

write_statement
    : 'print' '(' write_expression { r_print } ('.' write_expression { r_print })* ')' statement_end!
    ;

write_expression
    : expression
    ;

read_statement
    : 'gets' '(' ')' { r_gets } statement_end!
    ;

loop_statement
    : 'do' exp {times1}'times' block {times2}
    ;

function
@after {
    @current_scope = '_'
}
    : 'def' VAR_TYPE variable_name { @current_scope = $variable_name.text; func1($VAR_TYPE.text) } function_parameters block { func3($block.text) }
    ;

function_parameters
    : '(' parameters? ')'
    ;

parameters
    : VAR_TYPE variable_name { func2($variable_name.text, $VAR_TYPE.text) } (',' parameters)*
    ;

robot
    : 'change_color' '(' COLOR ')' { turtle_change_color($COLOR.text) }
    | 'change_direction' '(' DIR ')' { turtle_change_direction($DIR.text) }
    | 'talk' '(' expression ')' { turtle_talk }
    | 'pen_down' '(' ')' { turtle_send('pen_down') }
    | 'pen_up' '(' ')' { turtle_send('pen_up') }
    | 'reset' '(' ')' { turtle_send('reset') }
    | 'draw_circle' '(' expression ')' { turtle_send('draw_circle', 'int') }
    | 'draw_square' '(' expression ')' { turtle_send('draw_square', 'int') }
    | 'draw_rectangle' '(' expression ',' expression ')' { turtle_draw_rectangle }
    | 'move' '(' expression ')' { turtle_send('move', 'int') }
    ;

// Words

variable_name
    : ID
    ;

// Literals

primary
    : primitive { exp1(input.look(-1).text,
                    (type = input.look(-1).name) && type.downcase) }
    | functions
    | arrays
    ;

primitive
    : BOOLEAN
    | STRING
    | FLOAT
    | INT
    | variable_name
    ;

arrays
    : variable_name '[' exp ']' { array1($variable_name.text, $exp.text) }
    ;

functions
@after {
    @current_function = nil
}
    : variable_name { call_func1($variable_name.text) } '(' expression_list? ')' { call_func3 }
    ;

expression_list
    : { exp6 } expression { exp7; call_func2 } (',' expression_list)*
    ;

// Lexer

VAR_TYPE
    : 'boolean'
    | 'float'
    | 'int'
    | 'string'
    | 'void'
    ;

BOOLEAN
    : 'true'
    | 'false'
    ;

COLOR
    : 'black'
    | 'blue'
    | 'green'
    | 'orange'
    | 'purple'
    | 'random'
    | 'white'
    | 'yellow'
    | 'red'
    ;

DIR
    : 'down'
    | 'left'
    | 'right'
    | 'up'
    ;

FLOAT
    : ('0'..'9')+ '.' ('0'..'9')+
    ;

INT
    : ('0'..'9')+
    ;

STRING
    : '\'' (~('\'' | '\\') | '\\' .)* '\''
    | '"'  (~('"'  | '\\') | '\\' .)* '"'
    ;

ID
    : ('_' | 'a'..'z' | 'A'..'Z') ('a'..'z' | 'A'..'Z' | '0'..'9' | '_')*
    ;

NEWLINE
    : ('\n' | '\r')+ { $channel = HIDDEN }
    ;

WS
    : ('\t' | '\f' | ' ' | '\u00A0')+  { $channel = HIDDEN }
    ;
