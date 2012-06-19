/* lexico flex */
%{
  int i = 0;
  int chars = 1;
  int words = 0;
  int lines = 1;
%}

%%

[\n] { printf("\n"); lines++; chars = 1; }

"void"    { printf("%s<VOID> ",yytext)    ; words++; chars += strlen(yytext); }
"int"     { printf("%s<INT> ",yytext)     ; words++; chars += strlen(yytext); }
"char"    { printf("%s<CHAR> ",yytext)    ; words++; chars += strlen(yytext); }
"return"  { printf("%s<RETURN> ",yytext)  ; words++; chars += strlen(yytext); }
"break"   { printf("%s<BREAK> ",yytext)   ; words++; chars += strlen(yytext); }
"switch"  { printf("%s<SWITCH> ",yytext)  ; words++; chars += strlen(yytext); }
"case"    { printf("%s<CASE> ",yytext)    ; words++; chars += strlen(yytext); }
"default" { printf("%s<DEFAULT> ",yytext) ; words++; chars += strlen(yytext); }
"do"      { printf("%s<DO> ",yytext)      ; words++; chars += strlen(yytext); }
"while"   { printf("%s<WHILE> ",yytext)   ; words++; chars += strlen(yytext); }
"for"     { printf("%s<FOR> ",yytext)     ; words++; chars += strlen(yytext); }
"if"      { printf("%s<IF> ",yytext)      ; words++; chars += strlen(yytext); }
"else"    { printf("%s<ELSE> ",yytext)    ; words++; chars += strlen(yytext); }
"printf"  { printf("%s<PRINTF> ",yytext)  ; words++; chars += strlen(yytext); }
"define"  { printf("%s<DEFINE> ",yytext)  ; words++; chars += strlen(yytext); }
"exit"    { printf("%s<EXIT> ",yytext)    ; words++; chars += strlen(yytext); }

[/][*]([^*]|[*]+[^/])*[*]+[/] {i=0; while(i<strlen(yytext)){if (yytext[i]=='\n') lines++;i++;}; printf("<block:%d> ",(int)strlen(yytext));}
[/][/].*                      

[ \t] { chars += strlen(yytext); } /* Desconsidera tab e blank e conta caracteres */

0(X|x){1}[0-9A-Fa-f]+                { printf("%s<NUM_HEXA> ",yytext)    ; words++; chars += strlen(yytext); }

\'([^\']|\\.)?\'                      { printf("%s<CARACTER> ",yytext)    ; words++; chars += strlen(yytext); }

[a-zA-Z_][a-zA-Z0-9_]*        { printf("%s<IDENTIFIER> ",yytext)  ; words++; chars += strlen(yytext); }

\"(\\.|\"\"|[^"\n])*\"        { printf("%s<STRING> ",yytext)      ; words++; chars += strlen(yytext); }

^0[1-7][0-7]*$                { printf ("%s<NUM_OCTAL> ",yytext)  ; words++; chars += strlen(yytext); }
[+|-]{0,1}[0-9]+                    { printf("%s<NUM_INTEGER> ",yytext) ; words++; chars += strlen(yytext); }

"+"  { printf("%s<PLUS> ",yytext)                ; words++; chars += strlen(yytext); }
"-"  { printf("%s<MINUS> ",yytext)               ; words++; chars += strlen(yytext); }
"*"  { printf("%s<MULTIPLY> ",yytext)            ; words++; chars += strlen(yytext); }
"%"  { printf("%s<REMAINDER> ",yytext)           ; words++; chars += strlen(yytext); }
"++" { printf("%s<INC> ",yytext)                 ; words++; chars += strlen(yytext); }
"--" { printf("%s<DEC> ",yytext)                 ; words++; chars += strlen(yytext); }
"&"  { printf("%s<BITWISE_AND> ",yytext)         ; words++; chars += strlen(yytext); }
"|"  { printf("%s<BITWISE_OR> ",yytext)          ; words++; chars += strlen(yytext); }
"~"  { printf("%s<BITWISE_NOT> ",yytext)         ; words++; chars += strlen(yytext); }
"^"  { printf("%s<BITWISE_XOR> ",yytext)         ; words++; chars += strlen(yytext); }
"!"  { printf("%s<NOT> ",yytext)                 ; words++; chars += strlen(yytext); }
"&&" { printf("%s<LOGICAL_AND> ",yytext)         ; words++; chars += strlen(yytext); }
"||" { printf("%s<LOGICAL_OR> ",yytext)          ; words++; chars += strlen(yytext); }
"==" { printf("%s<EQUAL> ",yytext)               ; words++; chars += strlen(yytext); }
"!=" { printf("%s<NOT_EQUAL> ",yytext)           ; words++; chars += strlen(yytext); }
"<"  { printf("%s<LESS_THAN> ",yytext)           ; words++; chars += strlen(yytext); }
">"  { printf("%s<GREATER_THAN> ",yytext)        ; words++; chars += strlen(yytext); }
"<=" { printf("%s<LESS_EQUAL> ",yytext)          ; words++; chars += strlen(yytext); }
">=" { printf("%s<GREATER_EQUAL> ",yytext)       ; words++; chars += strlen(yytext); }
">>" { printf("%s<R_SHIFT> ",yytext)             ; words++; chars += strlen(yytext); }
"<<" { printf("%s<L_SHIFT> ",yytext)             ; words++; chars += strlen(yytext); }
"="  { printf("%s<ASSIGN> ",yytext)              ; words++; chars += strlen(yytext); }
"+=" { printf("%s<ADD_ASSIGN> ",yytext)          ; words++; chars += strlen(yytext); }
"-=" { printf("%s<MINUS_ASSIGN> ",yytext)        ; words++; chars += strlen(yytext); }
","  { printf("%s<COMMA> ",yytext)               ; words++; chars += strlen(yytext); }
":"  { printf("%s<COLON> ",yytext)               ; words++; chars += strlen(yytext); }
"("  { printf("%s<L_PAREN> ",yytext)             ; words++; chars += strlen(yytext); }
")"  { printf("%s<R_PAREN> ",yytext)             ; words++; chars += strlen(yytext); }
"{"  { printf("%s<L_CURLY_BRACKET> ",yytext)     ; words++; chars += strlen(yytext); }
"}"  { printf("%s<R_BRACE_BRACKET> ",yytext)     ; words++; chars += strlen(yytext); }
"?"  { printf("%s<TERNARY_CONDITIONAL> ",yytext) ; words++; chars += strlen(yytext); }
"#"  { printf("%s<NUMBER_SIGN> ",yytext)         ; words++; chars += strlen(yytext); }
";"  { printf("%s<SEMICOLON> ",yytext)           ; words++; chars += strlen(yytext); }

        /* comentário */


.  { printf("%s<ERRO->L:%d,C:%d> ",yytext,lines, chars);} /* qualquer outro caracter */
%%

int main(int argc, char **argv){
  yylex();
  //  printf("Lines: %d\tWords: %d\tChars: %d\n", lines, words, chars);
  return 0;
}
