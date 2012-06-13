/* lexico flex */
%{
  int chars = 0;
  int words = 0;
  int lines = 0;
%}

%%

"void"    { printf("VOID")    ; words++; chars += strlen(yytext); }
"int"     { printf("INT")     ; words++; chars += strlen(yytext); }
"char"    { printf("CHAR")    ; words++; chars += strlen(yytext); }
"return"  { printf("RETURN")  ; words++; chars += strlen(yytext); }
"break"   { printf("BREAK")   ; words++; chars += strlen(yytext); }
"switch"  { printf("SWITCH")  ; words++; chars += strlen(yytext); }
"case"    { printf("CASE")    ; words++; chars += strlen(yytext); }
"default" { printf("DEFAULT") ; words++; chars += strlen(yytext); }
"do"      { printf("DO")      ; words++; chars += strlen(yytext); }
"while"   { printf("WHILE")   ; words++; chars += strlen(yytext); }
"for"     { printf("FOR")     ; words++; chars += strlen(yytext); }
"if"      { printf("IF")      ; words++; chars += strlen(yytext); }
"else"    { printf("ELSE")    ; words++; chars += strlen(yytext); }
"printf"  { printf("PRINTF")  ; words++; chars += strlen(yytext); }
"define"  { printf("DEFINE")  ; words++; chars += strlen(yytext); }
"exit"    { printf("EXIT")    ; words++; chars += strlen(yytext); }

[/][*]([^*]|[*]+[^/])*[*]+[/] 
[/][/].*                      

X'[0-9A-Fa-f]+' | 
0X[0-9A-Fa-f]+                { printf("NUM_HEXA")    ; words++; chars += strlen(yytext); }

[a-zA-Z]                      { printf("CARACTER")    ; words++; chars += strlen(yytext); }
[a-zA-Z_][a-zA-Z0-9_]*        { printf("IDENTIFIER")  ; words++; chars += strlen(yytext); }

'(\\.|''|[^'\n])*' |
\"(\\.|\"\"|[^"\n])*\"        { printf("STRING")      ; words++; chars += strlen(yytext); }

[0-9]+                        { printf("NUM_INTEGER") ; words++; chars += strlen(yytext); }
^0[1-7][0-7]*$                { printf ("NUM_OCTAL")  ; words++; chars += strlen(yytext); }

"+"  { printf("PLUS")                ; words++; chars += strlen(yytext); }
"-"  { printf("MINUS")               ; words++; chars += strlen(yytext); }
"*"  { printf("MULTIPLY")            ; words++; chars += strlen(yytext); }
"%"  { printf("REMAINDER")           ; words++; chars += strlen(yytext); }
"++" { printf("INC")                 ; words++; chars += strlen(yytext); }
"--" { printf("DEC")                 ; words++; chars += strlen(yytext); }
"&"  { printf("BITWISE_AND")         ; words++; chars += strlen(yytext); }
"|"  { printf("BITWISE_OR")          ; words++; chars += strlen(yytext); }
"~"  { printf("BITWISE_NOT")         ; words++; chars += strlen(yytext); }
"^"  { printf("BITWISE_XOR")         ; words++; chars += strlen(yytext); }
"!"  { printf("NOT")                 ; words++; chars += strlen(yytext); }
"&&" { printf("LOGICAL_AND")         ; words++; chars += strlen(yytext); }
"||" { printf("LOGICAL_OR")          ; words++; chars += strlen(yytext); }
"==" { printf("EQUAL")               ; words++; chars += strlen(yytext); }
"!=" { printf("NOT_EQUAL")           ; words++; chars += strlen(yytext); }
"<"  { printf("LESS_THAN")           ; words++; chars += strlen(yytext); }
">"  { printf("GREATER_THAN")        ; words++; chars += strlen(yytext); }
"<=" { printf("LESS_EQUAL")          ; words++; chars += strlen(yytext); }
">=" { printf("GREATER_EQUAL")       ; words++; chars += strlen(yytext); }
">>" { printf("R_SHIFT")             ; words++; chars += strlen(yytext); }
"<<" { printf("L_SHIFT")             ; words++; chars += strlen(yytext); }
"="  { printf("ASSIGN")              ; words++; chars += strlen(yytext); }
"+=" { printf("ADD_ASSIGN")          ; words++; chars += strlen(yytext); }
"-=" { printf("MINUS_ASSIGN")        ; words++; chars += strlen(yytext); }
","  { printf("COMMA")               ; words++; chars += strlen(yytext); }
":"  { printf("COLON")               ; words++; chars += strlen(yytext); }
"("  { printf("L_PAREN")             ; words++; chars += strlen(yytext); }
")"  { printf("R_PAREN")             ; words++; chars += strlen(yytext); }
"{"  { printf("L_CURLY_BRACKET")     ; words++; chars += strlen(yytext); }
"}"  { printf("R_BRACE_BRACKET")     ; words++; chars += strlen(yytext); }
"?"  { printf("TERNARY_CONDITIONAL") ; words++; chars += strlen(yytext); }
"#"  { printf("NUMBER_SIGN")         ; words++; chars += strlen(yytext); }
";"  { printf("SEMICOLON")           ; words++; chars += strlen(yytext); }

%%

int main(int argc, char **argv){
  yylex();
  printf("Lines: %d\tWords: %d\tChars: %d\n", lines, words, chars);
  return 0;
}
