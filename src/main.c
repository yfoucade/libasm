#include <stdio.h>

unsigned long ft_strlen(char *s);

int main()
{
    char    *s = "hello";

    printf("ft_strlen(%s) = %lu\n", s, ft_strlen(s));
}
