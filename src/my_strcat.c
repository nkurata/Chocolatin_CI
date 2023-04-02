/*
** EPITECH PROJECT, 2022
** str
** File description:
** str
*/

char *my_strcat(char *dest, char const *src)
{
    int len = my_strlen(dest);
    int i;
    for (i = 0; src[i] != '\0'; i++) {
        dest[len + i] = src[i];
    }
    dest[len + i] = '\0';
    return dest;
}
