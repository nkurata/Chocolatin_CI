##
## EPITECH PROJECT, 2022
## choco_bread
## File description:
## Makefile
##

SRC		=	src/main.c

SRC_TEST 	= 	src/my_strcat.c
				src/my_strncat.c

CC		=	gcc

OBJ		=	$(SRC:.c=.o)

CFLAGS	=	-Wall -Wextra -Werror

NAME	=	choco

TESTS	=	tests/test_my_strcat.c
			tests/test_my_strncat.c

all:	$(OBJ)
	$(CC) -o $(NAME) $(SRC) $(CFLAGS)

tests_run:
	$(CC) -o unit_tests $(SRC) $(TESTS) --coverage -lcriterion
	./unit_tests

clean:
	rm -f $(NAME)

fclean:		clean
	rm -f $(OBJ)
	rm -f unit_tests
	rm -f *.gcda
	rm -f *.gcno

re:	clean all
