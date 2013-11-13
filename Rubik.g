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
    CHANGE_DIR='change_dir';
    COMMA=',';
    DEF='def';
    DIV='/';
    DO='do';
    DOT='.';
    DRAW_CIRCLE='draw_circle';
    DRAW_SQUARE='draw_square';
    DRAW_TRIANGLE='draw_triangle';
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
    VAR='var';
}

@parser::init {
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
    @cont_const = 0
    @cont_int = 0
    @cont_string = 0
    @cont_float = 0
    @cont_boolean = 0
    @aux_times = 0

    require 'symbols'
    require 'cubo_semantico'
    require 'cuadruplos'
}

// Top-level structure

program
    : 'begin' block+ 'end'
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
    : variable_statement
    | assignment_statement
    | condition_statement
    | write_statement
    | read_statement
    | loop_statement
    | return_statement
    | function
    ;

statement_end
    : ';'
    | ( '}' )=>
    | EOF
    ;

return_statement
    : 'return' expression statement_end!
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
        {
            define_variable($declaration_target.text, @current_var_type)
        }
    ;

declaration_target
    : variable_name ('[' INT ']')? ('[' INT ']')?
    ;

assignment_statement
    : ID { assign($ID.text) } '=' { exp2('=') } expression { exp9 } statement_end!
    ;

condition_statement
    : 'if' '(' expression ')' block ('else' block)?
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
    : 'do' exp 'times' block
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
    : 'change_color' '(' COLOR ')'
    | 'change_direction' '(' DIR ')'
    | 'draw_circle' '(' expression ')'
    | 'draw_square' '(' expression ')'
    | 'draw_triangle' '(' expression ')'
    | 'pen_down' '(' ')'
    | 'pen_up' '(' ')'
    | 'reset' '(' ')'
    | 'talk' '(' expression ')'
    | 'move' '(' expression ')'
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
    : variable_name '[' expression ']' ('[' expression ']')?
    ;

functions
@after {
    @current_function = nil
}
    : variable_name { call_func1($variable_name.text) } '(' expression_list ')' { call_func3 }
    ;

expression_list
    : expression { call_func2 } (',' expression_list)*
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
    : 'rBlack'
    | 'rBlue'
    | 'rGreen'
    | 'rOrange'
    | 'rPurple'
    | 'rRandom'
    | 'rWhite'
    | 'rYellow'
    | 'rRed'
    ;

DIR
    : 'rDown'
    | 'rLeft'
    | 'rRight'
    | 'rUp'
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
