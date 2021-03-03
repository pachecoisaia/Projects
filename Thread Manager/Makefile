EXEC = bots
CC = gcc
FILES = main.c bots.h
LINKERS = -pthread -lpthread

all: clean $(EXEC)

$(EXEC):
	$(CC) -o EXEC $(FILES) $(LINKERS)
clean:
	rm -f $(EXEC) QUOTE.txt