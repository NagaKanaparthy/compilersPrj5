# Project 5 - SQL Grammer with Flex and Bison
#### Nagavarun Kanaparthy
### Purpose
To demonstrate usage of the Flex and Bison to generate the SQL Parser Program.
It also help us for the Data Modeling Class here at UNF, since the final project
uses this project as assistance during classes between the year of 2014 to 2016.
### SQL Grammer
```
start
        ::= expression

expression
        ::= one-relation-expression | two-relation-expression

one-relation-expression
        ::= renaming | restriction | projection

renaming
        ::= term RENAME attribute AS attribute

term
        ::= relation | ( expression )

restriction
        ::= term WHERE comparison

projection
        ::= term | term [ attribute-commalist ]

attribute-commalist
        ::= attribute | attribute , attribute-commalist

two-relation-expression
        ::= projection binary-operation expression

binary-operation
        ::= UNION | INTERSECT | MINUS | TIMES | JOIN | DIVIDEBY

comparison
        ::= attribute compare number

compare
        ::= < | > | <= | >= | = | <>

number
        ::= val | val number

val
        ::= 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9

attribute
        ::= CNO | CITY | CNAME | SNO | PNO | TQTY |
                  SNAME | QUOTA | PNAME | COST | AVQTY |
                  S# | STATUS | P# | COLOR | WEIGHT | QTY

relation
        ::= S | P | SP | PRDCT | CUST | ORDERS
```
### Execution and Compiliation
```bash
make
./p5 "Insert your file name here"
```
#### Flex Manual Compiliation
```bash
felx sql.l
```
#### Bison Manual Compiliation
```bash
bison sql.y
```
