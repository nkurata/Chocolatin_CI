##
## EPITECH PROJECT, 2022
## choco_bread
## File description:
## Makefile
##

SRC:		src/main.c

CC:		gcc

OBJ:		$(SRC:.c=.o)

CFLAGS:		-Wall -Wextra -Werror

NAME: 		choco

all:	$(OBJ)
	$(CC) -o $(NAME) $(SRC) $(CFLAGS)

tests_run:
	$(CC) -o unit_tests $(SRC) tests/*.c --coverage -lcriterion
	./unit_tests

clean:
	rm -f $(NAME)

fclean:		clean

re:	clean all
