%{
#include "saudacao.tab.h" 
#include <stdio.h>       
#include <string.h>      

extern YYSTYPE yylval;

%}

%%

"OLÁ"       { return OLA; }    

[a-zA-Z]+   { 
                yylval.strval = strdup(yytext); 
                return NOME; 
            }

[ \t\n]+     ;        /* ignora espaços, tabs, quebras de linha */

.           { 
                fprintf(stderr, "Erro lexico: Caractere invalido '%s'\n", yytext);
                return -1; 
            }

%%

int yywrap() {
    return 1;
}