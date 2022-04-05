   /* cs152-miniL phase1 */
   
%{   
   /* write your C code here for definitions of variables and including headers */
   int currLine = 1, currPos = 1;
%}

   /* some common rules */
DIGIT [0-9]
CHAR  [a-z|A-Z]

%%
   /* specific lexer rules in regex */
"function"     {printf("FUNCTION\n"); }
"beginparams"  {printf("BEGIN_PARAMS\n"); }
"endparams"    {printf("END_PARAMS\n"); }
"beginlocals"  {printf("BEGIN_LOCALS\n"); }
"endlocals"    {printf("END_LOCALS\n"); }
"beginbody"    {printf("BEGIN BODY\n"); }
"endbody"      {printf("END_BODY\n"); }
"integer"      {printf("INTEGER\n"); }
"array"        {printf("ARRAY\n"); }
"enum"         {printf("ENUM\n"); }
"of"           {printf("OF\n"); }
"if"           {printf("IF\n"); }
"then"         {printf("THEN\n"); }
"endif"        {printf("ENDIF\n"); }
"else"         {printf("ELSE\n"); }
"while"        {printf("WHILE\n"); }
"do"           {printf("WHILE\n"); }
"beginloop"    {printf("BEGINLOOP\n"); }
"endloop"      {printf("ENDLOOP\n"); }
"continue"     {printf("CONTINUE\n"); }
"read"         {printf("READ\n"); }
"write"        {printf("WRITE\n"); }
"and"          {printf("AND\n"); }
"or"           {printf("OR\n"); }
"not"          {printf("NOT\n"); }
"true"         {printf("TRUE\n"); }
"false"        {printf("FALSE\n"); }
"return"       {printf("RETURN\n"); }
"+"   {printf("ADD\n"); }
"-"   {printf("SUB\n"); }
"*"   {printf("MULT\n"); }
"/"   {printf("DIV\n"); }
"%"   {printf("MOD\n"); }
"=="  {printf("EQ\n"); }
"<>"  {printf("NEQ\n"); }
"<"   {printf("LT\n"); }
">"   {printf("GT\n"); }
"<="  {printf("LTE\n"); }
">="  {printf("GTE\n"); }
";"   {printf("SEMICOLON\n"); }
":"   {printf("COLON\n"); }
","   {printf("COMMA\n"); }
"("   {printf("L_PAREN\n"); }
")"   {printf("R_PAREN\n"); }
"["   {printf("L_SQUARE_BRACKET\n"); }
"]"   {printf("R_SQUARE_BRACKET\n"); }
":="  {printf("ASSIGN\n"); }
{DIGIT}+          {printf("NUMBER %s\n", yytext); }
{CHAR}({CHAR}|{DIGIT})*(_({CHAR}|{DIGIT})*)*    {printf("IDENT %s\n", yytext); }
[ \t]+   {currPos += yyleng;}
"\n"     {currLine++; currPos = 1;}
##[^\n]* {currPos += yyleng;}  
.  {printf("Error at line %d: unrecognized symbol \"%s\"\n", currLine, yytext); exit(0);}
%%
	/* C functions used in lexer */
   int yywrap(){}

int main(int argc, char ** argv)
{
   if (argc >= 2)
   {
      yyin = fopen(argv[1], "r");
      if (yyin == NULL)
      {
         yyin = stdin;
      }
   }
   else
   {
      yyin = stdin;
   }
   yylex();
}