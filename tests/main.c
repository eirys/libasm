/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: etran <etran@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/01/22 16:53:09 by etran             #+#    #+#             */
/*   Updated: 2024/01/26 19:37:55 by etran            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

/**
 * This is a test main.
*/
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <assert.h>
#include <unistd.h>

// Mandatory
uint64_t    ft_strlen(char const* str);
char*       ft_strcpy(char* dst, char const* src);
char*       ft_strdup(char const* src);
int         ft_strcmp(const char* s1, const char* s2);
ssize_t     ft_write(int fildes, const void* buf, size_t nbyte);
ssize_t     ft_read(int fildes, void* buf, size_t nbyte);
int         ft_atoi_base(char const* str, char const* base);

// Bonus
typedef struct s_list
{
    void            *data;
    struct s_list   *next;
} t_list;

void        ft_list_push_front(t_list **begin_list, void *data);

#define LOG(X)  printf("%s\n", X)

int main(int ac, char** av) {
    if (ac != 3) {
        LOG("Input 2 args to test atoi as well.");
        return 1;
    }

	printf("%d\n", ft_atoi_base(av[1],av[2]));

    char* lol = ft_strdup("Hello world!");
    uint64_t len =  ft_strlen(lol);
    char* tmp = malloc(sizeof(uint8_t) * (len + 1));

    LOG(ft_strcpy(tmp, lol));
    LOG(lol);

    LOG(ft_strcpy(tmp, ""));
    LOG(lol);

    assert(ft_strcmp("42a\0", "42ai\0") < 0);

    int new_len = len;
    while ((new_len = ft_read(STDIN_FILENO, tmp, new_len)) != 0)
    {
        ft_write(STDOUT_FILENO, tmp, new_len);
        tmp[new_len] = 0;
    }

    free(lol);
    free(tmp);

    char a[] = "grosse merde\n";
    t_list* begin = NULL;
    ft_list_push_front(&begin, &a);
    assert(begin != 0);
    ft_write(STDOUT_FILENO, (char *)begin->data, ft_strlen((char *)begin->data));

    free(begin);
    return 0;
}