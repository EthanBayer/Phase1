   /* cs152-miniL phase1 */
   
%{   
   /* write your C code here for definitions of variables and including headers */
%}

   /* some common rules */
DIGIT [0-9]
CHAR  [a-z|A-Z]

%%
   /* specific lexer rules in regex */
/* Reserved Words */
"function"     {printf(" FUNCTION "); }
"beginparams"  {printf(" BEGIN_PARAMS "); }
"endparams"    {printf(" END_PARAMS); }
"beginlocals"  {printf(" BEGIN_LOCALS "); }
"endlocals"    {printf(" END_LOCALS "); }
"beginbody"    {printf(" BEGIN BODY "); }
"endbody"      {printf(" END_BODY "); }
"integer"      {printf(" INTEGER "); }
"array"        {printf(" ARRAY "); }
"enum"         {printf(" ENUM "); }
"of"           {printf(" OF "); }
"if"           {printf(" IF "); }
"then"         {printf(" THEN "); }
"endif"        {printf(" ENDIF "); }
"else"         {printf(" ELSE "); }
"while"        {printf(" WHILE "); }
"do"           {printf(" WHILE "); }
"beginloop"    {pritnf(" BEGINLOOP "); }
"endloop"      {printf(" ENDLOOP "); }
"continue"     {printf(" CONTINUE "); }
"read"         {printf(" READ "); }
"write"        {printf(" WRITE "); }
"and"          {printf(" AND "); }
"or"           {printf(" OR "); }
"not"          {printf(" NOT "); }
"true"         {printf(" TRUE "); }
"false"        {printf(" FALSE "); }
"return"       {printf(" RETURN "); }
/* Arithmetic Operators */
"+"   {printf(" ADD "); }
"-"   {printf(" SUB "); }
"*"   {printf(" MULT "); }
"/"   {printf(" DIV "); }
"%"   {printf(" MOD "); }
/* Comparison Operators */
"=="  {printf(" EQ "); }
"<>"  {printf(" NEQ "); }
"<"   {printf(" LT "); }
">"   {printf(" GT "); }
"<="  {printf(" LTE "); }
">="  {printf(" GTE "); }
/* Other Special Symbols */
";"   {printf(" SEMICOLON "); }
":"   {printf(" COLON "); }
","   {printf(" COMMA "); }
"("   {printf(" L_PAREN "); }
")"   {printf(" R_PAREN "); }
"["   {printf(" L_SQUARE_BRACKET "); }
"]"   {printf(" R_SQUARE_BRACKET "); }
":="  {printf(" ASSIGN "); }
/* ---Identifiers and Numbers--- */
{DIGIT}+          {printf("NUMBER %s\n", yytext); }
/* Invalid Symbol */
.     {printf("ERROR, NOT RECOGNIZED SYMBOL\n"); exit(0);}
%%
	/* C functions used in lexer */

int main(int argc, char ** argv)
{
   yylex();
}
