%{
#include <stdio.h>
#include <stdlib.h>
extern FILE *yyin;
extern int yylineno;
%}

%option noyywrap
%option yylineno

%%
"if"     { printf("%-10d %-15s %-15s\n", yylineno, yytext, "KEYWORD"); }
"for"    { printf("%-10d %-15s %-15s\n", yylineno, yytext, "KEYWORD"); }
"else"   { printf("%-10d %-15s %-15s\n", yylineno, yytext, "KEYWORD"); }
"while"  { printf("%-10d %-15s %-15s\n", yylineno, yytext, "KEYWORD"); }
"printf" { printf("%-10d %-15s %-15s\n", yylineno, yytext, "KEYWORD"); }
"scanf"  { printf("%-10d %-15s %-15s\n", yylineno, yytext, "KEYWORD"); }
"return" { printf("%-10d %-15s %-15s\n", yylineno, yytext, "KEYWORD"); }
"main"   { printf("%-10d %-15s %-15s\n", yylineno, yytext, "KEYWORD"); }
"include"{ printf("%-10d %-15s %-15s\n", yylineno, yytext, "KEYWORD"); }

[<>{}():;#] { printf("%-10d %-15s %-15s\n", yylineno, yytext, "SPECIAL"); }

[0-9]+ { printf("%-10d %-15s %-15s\n", yylineno, yytext, "NUMBER"); }

[a-zA-Z][a-zA-Z0-9]* { printf("%-10d %-15s %-15s\n", yylineno, yytext, "IDENTIFIER"); }

"+"|"-"|"*"|"/" { printf("%-10d %-15s %-15s\n", yylineno, yytext, "OPERATOR"); }

[ \t\n]+ ;
. ;

%%
int main(){
    char filename[100];
    FILE *fp;

    printf("Enter the C file name: ");
    scanf("%s", filename);

    fp = fopen(filename, "r");

    if (!fp){
        printf("Error opening file\n");
        return 1;
    }

    yyin = fp;

    printf("%-10s %-15s %-15s\n", "LINE", "LEXEME", "TOKEN");
    printf("--------------------------------------------------------\n");

    yylex();

    fclose(fp);
    return 0;
}

# flex file3.l
# gcc lex.yy.c -o file3 -lfl
# ./file3