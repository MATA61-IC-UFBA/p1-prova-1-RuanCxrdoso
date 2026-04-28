%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(char *s, ...);
int yylex();
%}

%token NUM ID STR
%token PRINT CONCAT LENGTH
%token EOL

%%

program
: stmt_list
;

stmt_list
: stmt_list stmt
| stmt
;

stmt
: expr EOL
| assignment EOL
| print_stmt EOL
| EOL
;

assignment
: ID '=' expr
;

print_stmt
: PRINT expr_list
;

expr_list
: expr_list ',' expr
| expr
;

expr
: expr '+' term
| expr '-' term
| term
;

term
: term '*' factor
| term '/' factor
| factor
;

factor
: '(' expr ')'
| NUM
| ID
| STR
| function_call
;

function_call
: CONCAT '(' expr_list ')'
| LENGTH '(' expr ')'
;

%%
