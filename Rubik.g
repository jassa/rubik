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
    ;

declaration_target
    : variable_name ('[' INT ']')? ('[' INT ']')?
        {
            if $block::symbols.has_key?(var = String($variable_name.text).to_sym)
              raise "'#{var}' has already been declared"
            else
              $block::symbols[var] = 1
              # change '1' for var type
            end
        }
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
