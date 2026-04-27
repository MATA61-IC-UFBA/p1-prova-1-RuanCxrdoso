/* e2.y */

%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(char *s, ...);
int yylex();
%}

%token NUM
%token EOL 0

%%
program
: expr EOL
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
;

%%
