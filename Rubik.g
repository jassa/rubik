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
    require 'symbols'
}

// Top-level structure

program
    : 'begin' block+ 'end'
    ;

block
scope {
    symbols;
}
@init {
    $block::symbols = Hash.new;
}
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
    : VAR_TYPE variable_declaration_list statement_end!
    ;

variable_declaration_list
    : variable_declaration (',' variable_declaration)*
    ;

variable_declaration
    : declaration_target ('=' expression)?
        {
            define_variable($declaration_target.text, $expression.text)
        }
    ;

declaration_target
    : variable_name ('[' INT ']')? ('[' INT ']')?
    ;

assignment_statement
    : ID '=' expression statement_end!
        {
            $block::symbols.has_key?(var = String($ID.text).to_sym) or
                raise "'#{var}' has not been declared"
            # check type of $block::symbols[var] against VAR_TYPES
        }
    ;

condition_statement
    : 'if' '(' expression ')' block ('else' block)?
    ;

expression
    : exp (relation_op exp)?
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
    : term (('+'|'-') exp)?
    ;

term
    : factor (('*'|'/') term)?
    ;

factor
    : '(' expression ')'
    | '-'? primary
    ;

expression_list
    : expression (',' expression)*
    ;

write_statement
    : 'print' '(' write_expression ('.' write_expression)* ')' statement_end!
    ;

write_expression
    : expression
    | STRING
    ;

loop_statement
    : 'do' exp 'times' block
    ;

function
    : 'def' VAR_TYPE variable_name function_parameters block
        {
            has_return = !(String($block.text) =~ /return/).nil?
            if String($VAR_TYPE) == 'void'
              raise "'void' function should not have return statement" if has_return
            else
              unless has_return
                raise "missing return statement for '#{$VAR_TYPE.text}'"
              end
            end
        }
    ;

function_parameters
    : '(' parameters? ')'
    ;

parameters
    : VAR_TYPE variable_name (',' VAR_TYPE variable_name)*
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
    : BOOLEAN
    | CHAR
    | FLOAT
    | INT
    | variable_name ('[' expression ']')? ('[' expression ']')?
    | variable_name ('(' expression_list ')')
    ;

// Lexer

VAR_TYPE
    : 'boolean'
    | 'char'
    | 'float'
    | 'int'
    | 'void'
    ;

BOOLEAN
    : 'true'
    | 'false'
    ;

CHAR
    : '\'' + ('a'..'z' | 'A'..'Z') + '\''
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
