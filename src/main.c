#include <stdio.h>
#include <stdlib.h>

unsigned long   ft_strlen(char *s);
char            *ft_strcpy(char *dest, char *src);

int main()
{
    char    *s = "hello";

    printf("ft_strlen(%s) = %lu\n", s, ft_strlen(s));

    char    *dest = (char *)malloc(50);
    dest = ft_strcpy(dest, s);
    printf("dest = %s\n", dest);
    free(dest);
}
