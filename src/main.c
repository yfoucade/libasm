#include <stdio.h>
#include <stdlib.h>

unsigned long   ft_strlen(char *s);
char            *ft_strcpy(char *dest, char *src);
int             ft_strcmp(char *s1, char *s2);

int main()
{
    char    *s1 = "hello";
    char    *dest = (char *)malloc(50);

    printf("ft_strlen(%s) = %lu\n", s1, ft_strlen(s1));

    dest = ft_strcpy(dest, s1);
    printf("dest = %s\n", dest);
    free(dest);

    char *s2 = "goodbye";
    char *s3 = "hello";
    printf("ft_strcmp(%s, %s) = %d\n", s1, s2, ft_strcmp(s1, s2));
    printf("ft_strcmp(%s, %s) = %d\n", s1, s3, ft_strcmp(s1, s3));
    printf("ft_strcmp(%s, %s) = %d\n", s2, s1, ft_strcmp(s2, s1));
}
