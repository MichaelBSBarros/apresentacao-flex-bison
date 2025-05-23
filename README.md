# apresentacao-flex-bison
codigo simples para simular erros sintaticos e lexicos utilizando uma gramatica personalizada com flex e bison.

# OBSERVACAO
o codigo deve passar por uma depuracao, pois, mesmo incluindo um valor de entrada valido eh retornado erro de sintaxe;

# CONFIGURACAO

    instalar MSYS2 MinGW 64-bit

    Comandos shellr:

        pacman -Syu
        pacman -S make mingw-w64-x86_64-gcc \
            mingw-w64-x86_64-flex    \
            mingw-w64-x86_64-bison

        cd diretorio_do_projeto

        bison -d -o saudacao.tab.c saudacao.y

        flex  -o saudacao.lex.c  saudacao.l

        gcc -o saudacao.exe main.c saudacao.tab.c saudacao.lex.c

        ./saudacao.exe