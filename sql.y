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
Program     :   expression{ printf("ACCEPT"); };

expression  :   oneRelationExpression { printf("expression one relation expression"); };
                | twoRelationExpression { printf("expression two relation expression"); };

oneRelationExpression : renaming { printf("one relation expression renaming\n"); };
                        | restriction { printf("one relation expression restriction\n"); };
                        | projection { printf("one relation expression projection\n"); };

renaming :  term RENAME attribute AS attribute { printf("renaming\n"); };

term :  relation{ printf("term\n"); };
        | LeftPer expression RightPer { };

restriction :   term WHERE comparison { };

projection :    term {}; 
                | term LeftBracket attributeCommalist RightBracket {};

attributeCommalist :   attribute { }; | attribute Comma attributeCommalist

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

attribute : CNO { printf("ATTRIBUTE\n"); };
            | CITY { printf("ATTRIBUTE\n"); };
            | CNAME { printf("ATTRIBUTE\n"); };
            | SNO { printf("ATTRIBUTE\n"); };
            | PNO { printf("ATTRIBUTE\n"); };
            | TQTY { printf("ATTRIBUTE\n"); };
            | SNAME { printf("ATTRIBUTE\n"); };
            | QUOTA { printf("ATTRIBUTE\n"); };
            | COST { printf("ATTRIBUTE\n"); };
            | AVQTY { printf("ATTRIBUTE\n"); };
            | SNum { printf("ATTRIBUTE\n"); };
            | STATUS { printf("ATTRIBUTE\n"); };
            | PNum { printf("ATTRIBUTE\n"); };
            | COLOR { printf("ATTRIBUTE\n"); };
            | WEIGHT { printf("ATTRIBUTE\n"); };
            | QTY { printf("ATTRIBUTE\n"); };

relation :  S {}; | P {}; | SP {}; | PRDCT {}; | CUST {}; | ORDERS {};
%%
#include "lex.yy.c"
main(){
    yyparse();
}
yyerror(char* error){
    printf(": error from yyerror\n");
    printf("%s\n", error);
}
yywrap(){
    printf("in yywarp\n");
}