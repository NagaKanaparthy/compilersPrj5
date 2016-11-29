sql: sql.tab.c lex.yy.c
	gcc sql.tab.c -o p5
	@echo "------------------------------------------"
	@echo "Documentation in README.md file"
	@echo "Test cases in tests folder"
	@echo "------------------------------------------"
sql.tab.c:sql.y
	bison -vd sql.y
lex.yy.c: sql.l
	flex -l sql.l
