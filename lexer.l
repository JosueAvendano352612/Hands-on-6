%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "y.tab.h"

int yylineno = 1;
%}

%%

"int"               { return RESERVED; }
"void"              { return RESERVED; }
"float"             { return RESERVED; }
"double"            { return RESERVED; }
"char"              { return RESERVED; }
"return"            { return RETURN; }

"++"                { return OP_INCREMENT; }
"="                 { return '='; }
";"                 { return ';'; }
","                 { return ','; }
"("                 { return '('; }
")"                 { return ')'; }
"{"                 { return '{'; }
"}"                 { return '}'; }
"+"                 { return '+'; }
"-"                 { return '-'; }
"*"                 { return '*'; }
"/"                 { return '/'; }

[0-9]+              { yylval.ival = atoi(yytext); return NUMBER; }
[a-zA-Z_][a-zA-Z0-9_]* { yylval.sval = strdup(yytext); return ID; }

"//".*                                { }   /* comentario línea */
\/\*([^*]|\*+[^/])*\*\/               { }   /* comentario bloque */

[ \t\r]+                { }
\n                      { yylineno++; }

.                       { printf("Token desconocido: %s\n", yytext); return UNKNOWN; }


%%

int yywrap(void) { return 1; }
