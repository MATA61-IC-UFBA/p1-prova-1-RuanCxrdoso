/* recognize tokens for the calculator */

%option noyywrap
%{
#include "token.h"
%}


%%

[ \t\r]+    { }

[0-9]+      { return NUM; }

"+"         { return '+'; }
"-"         { return '-'; }
"*"         { return '*'; }
"/"         { return '/'; }
"("         { return '('; }
")"         { return ')'; }

\n          { return EOL; }

.           { return yytext[0]; }

%%
