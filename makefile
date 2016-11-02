sql: sql.tab.c lex.yy.c
	echo "Documentation in README.md"
	cc sql.tab.c -o sql
sql.tab.c:sql.y
	bison sql.y
lex.yy.c: sql.l
	flex sql.l
