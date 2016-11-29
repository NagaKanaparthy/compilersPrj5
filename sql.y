%{
#include <stdio.h>
extern yylex();
//extern yytext;
%}
%start Program
%token Equal LessThan GreaterThan LessGreater LessThanEqual GreaterThanEqual
%token LeftPer RightPer LeftBracket RightBracket LeftCurlyBracket
%token RightCurlyBracket Comma CNO CITY CNAME SNO PNO COST TQTY SNAME
%token QUOTA PNAME AVQTY SNum PNum COLOR WEIGHT QTY UNION INTERSECT MINUS
%token TIMES JOIN DIVIDEBY WHERE RENAME AS S P SP PRDCT CUST ORDERS STATUS
%token val
%%
Program     :   expression{ printf("ACCEPT\n"); };

expression  :   oneRelationExpression {};
                | twoRelationExpression {};

oneRelationExpression : renaming {};
                        | restriction {};
                        | projection {}; 

renaming :  term RENAME attribute AS attribute {};

term :  relation {};
        | LeftPer expression RightPer {};

restriction :   term WHERE comparison {};

projection :    term {}; 
                | term LeftBracket attributeCommalist RightBracket {};

attributeCommalist :	attribute { }; 
			| attribute Comma attributeCommalist {};

twoRelationExpression : projection binaryOperation expression {};

binaryOperation :   UNION {};
                    | INTERSECT {};
                    | MINUS {};
                    | TIMES {};
                    | JOIN {};
                    | DIVIDEBY {};

comparison :    attribute compare number {};

compare :   LessThan {};
            | GreaterThan {};
            | LessGreater {};
            | LessThanEqual {};
            | GreaterThanEqual {};
            | Equal {};

number :    val {};
            | val number {};

attribute : CNO {};
            | CITY {};
            | CNAME {};
            | SNO {};
            | PNO {};
            | TQTY {};
            | SNAME {};
            | QUOTA {};
            | COST {};
            | AVQTY {};
            | SNum {};
            | STATUS {};
            | PNum {};
            | COLOR {};
            | WEIGHT {};
            | QTY {};

relation :	S {};
		| P {}; 
		| SP {}; 
		| PRDCT {}; 
		| CUST {}; 
		| ORDERS {};
%%
#include "lex.yy.c"
main(){
    yyparse();
}
