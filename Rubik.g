grammar Rubik;

options {
    language = Ruby;
    output = AST;
}

tokens {
    BLOCK;
    LBRACE='{';
    RBRACE='}';
    SEMI=';';
    PLUS='+';
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
    ;

declaration_target
    : variable_name ('[' INT ']')? ('[' INT ']')?
    ;

assignment_statement
    : ID '=' expression statement_end!
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
    ;

function_parameters
    : '(' parameters? ')'
    ;

parameters
    : VAR_TYPE variable_name (',' VAR_TYPE variable_name)*
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
