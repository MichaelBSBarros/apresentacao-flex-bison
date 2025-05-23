%{
#include <stdio.h>
#include <stdlib.h> 
#include <string.h> 

extern int yylex();

extern int yyerror(const char *s);

%}

%union {
    char *strval; 
}

%token OLA
%token <strval> NOME 

%type <strval> saudacao
%% 

programa:
    saudacao '\n' { printf("Processado: %s\n", $1); free($1); YYACCEPT; } 
    | error '\n' { printf("Erro na frase! Tente 'OLA [SEU NOME]'\n"); YYABORT; } 
;

saudacao:
    OLA NOME {
        
        $$ = (char *)malloc(strlen("Ola, ") + strlen($2) + strlen("!") + 1);
        if ($$ == NULL) {
            perror("Erro de alocacao de memoria");
            exit(1);
        }
        sprintf($$, "Ola, %s!", $2); 
        free($2); 
    }
;
%% 

int yyerror(const char *s) {
    fprintf(stderr, "Erro de sintaxe. %s\n", s);
    return 0; 
              
}