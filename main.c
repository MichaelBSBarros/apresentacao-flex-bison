#include <stdio.h>

extern int yyparse();

int main() {
    printf("Informe saudacao (ex: OLA Joao)\n");
    return yyparse();
}