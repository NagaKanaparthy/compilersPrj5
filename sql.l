%{
#include "sql.tab.h"
extern int yylval;
extern int yylex(void);
%}
Delimiter	[ \t]
WhiteSpace	{Delimiter}+
Letter		[A-Za-z]
Digit		[0-9]
%%
{WhiteSpace}	;
{Digit}+		{
					yylval = atoi(yytext);
					return val;   
				}
"="				return Equal;
"<"				return LessThan;
">"				return GreaterThan;
"<="			return LessThanEqual;
">="			return GreaterThanEqual;
"<>"			return LessGreater;
"("				return LeftPer;
")"				return RightPer;
"["				return LeftBracket;	
"]"				return RightBracket;	
"{"				return LeftCurlyBracket;	
"}"				return RightCurlyBracket;	
","				return Comma;
\n				return 0;
"CNO"			return CNO;	
"CITY"			return CITY;	
"CNAME"			return CNAME;	
"SNO"			return SNO;	
"PNO"			return PNO;	
"TQTY"			return TQTY;	
"SNAME"			return SNAME;	
"QUOTA"			return QUOTA;	
"PNAME"			return PNAME;	
"AVQTY"			return AVQTY;	
"S#"			return SNum;	
"P#"			return PNum;	
"COLOR"			return COLOR;	
"WEIGHT"		return WEIGHT;	
"QTY"			return QTY;	
"UNION"			return UNION;
"INTERSECT"		return INTERSECT;
"MINUS"			return MINUS;
"TIMES"			return TIMES;
"JOIN"			return JOIN;
"DIVIDEBY"		return DIVIDEBY;
"WHERE"			return WHERE;
"RENAME"		return RENAME;
"AS"			return AS;
"S"				return S;
"P"				return P;
"SP"			return SP;
"PRDCT"			return PRDCT;
"CUST"			return CUST;
"ORDERS"		return ORDERS;
"STATUS"		return STATUS;
%%
yyerror(char* error){
    printf("REJECT\n");
}
yywrap(){
}

