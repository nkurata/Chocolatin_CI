/*
** EPITECH PROJECT, 2022
** choco_bread
** File description:
** test.c
*/

#include <criterion/criterion.h>
#include <criterion/redirect.h>

int hello(void);

Test(hello, test)
{
    cr_assert_eq(hello(), 0);
}