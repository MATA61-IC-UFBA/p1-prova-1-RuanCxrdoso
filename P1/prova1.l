%{
#include "token.h"
%}

%option noyywrap

%%

[ \t\r]+    {  }

"\\".*      { }

"print"     { return PRINT; }
"concat"    { return CONCAT; }
"length"    { return LENGTH; }

[a-zA-Z_][a-zA-Z0-9_]* { return ID; }

[0-9]+      { return NUM; }

\"[^\n"]*\" { return STR; }

"+"         { return '+'; }
"-"         { return '-'; }
"*"         { return '*'; }
"/"         { return '/'; }
"("         { return '('; }
")"         { return ')'; }
"="         { return '='; }
","         { return ','; }
";"         { return ';'; }

\n          { return EOL; }

.           { return yytext[0]; }

%%
