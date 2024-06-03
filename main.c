#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

unsigned long   ft_strlen(char *s);
char            *ft_strcpy(char *dest, char *src);
int             ft_strcmp(char *s1, char *s2);
ssize_t         ft_write(int fd, const char *buf, size_t count);
ssize_t         ft_read(int fd, const char *buf, size_t count);
char            *ft_strdup(const char *s);

int main()
{
    char    *s1 = "hello";
    char    *dest = (char *)malloc(50);

    printf("ft_strlen(%s) = %lu\n", s1, ft_strlen(s1));

    dest = ft_strcpy(dest, s1);
    printf("dest = %s\n", dest);

    char *s2 = "goodbye";
    char *s3 = "hello";
    printf("ft_strcmp(%s, %s) = %d\n", s1, s2, ft_strcmp(s1, s2));
    printf("ft_strcmp(%s, %s) = %d\n", s1, s3, ft_strcmp(s1, s3));
    printf("ft_strcmp(%s, %s) = %d\n", s2, s1, ft_strcmp(s2, s1));

    int ret;
    ft_write(1, "Goodbye\n", 8);
    ret = ft_write(-1, "Goodbye\n", 8);
    printf("ret = %d\n", ret);
    if (ret == -1) {
        perror(strerror(errno));
    }
    ret = ft_write(1, NULL, 1);
    printf("ret = %d\n", ret);
    if (ret == -1) {
        perror(strerror(errno));
        printf("errno = %d\n", errno);
    }

    ret = ft_read(0, dest, 10);
    printf("dest = %s\n", dest);
    ret = ft_read(42, dest, 10);
    if (ret == -1) {
        perror(strerror(errno));
    }

    char *new_str = ft_strdup("This string has been copied!");
    printf("%s\n", new_str);

    free(dest);
    free(new_str);
}
