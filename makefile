sql: sql.tab.c lex.yy.c
	cc sql.tab.c -o p5
	@echo "------------------------------------------"
	@echo "Documentation in README.md file"
	@echo "------------------------------------------"
sql.tab.c:sql.y
	bison -vd sql.y
lex.yy.c: sql.l
	flex -l sql.l
