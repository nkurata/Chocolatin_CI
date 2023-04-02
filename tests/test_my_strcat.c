/*
** EPITECH PROJECT, 2022
** choco_bread
** File description:
** test_my_strcat.c
*/


#include <criterion/criterion.h>
char *my_strcat(char *dest, char const *src);
Test (my_strcat , teststrcat)
{
    char i[] = "Hello";
    char *test = my_strcat(i, "World");
    cr_assert_str_eq(test, "HelloWorld");
}
