/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: etran <etran@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/01/12 17:02:07 by etran             #+#    #+#             */
/*   Updated: 2024/01/22 15:45:53 by etran            ###   ########.fr       */
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

uint64_t    ft_strlen(char const* str);
char*       ft_strcpy(char* dst, char const* src);
char*       ft_strdup(char const* src);
int         ft_strcmp(const char *s1, const char *s2);
ssize_t     ft_write(int fildes, const void *buf, size_t nbyte);
ssize_t     ft_read(int fildes, void *buf, size_t nbyte);

#define LOG(X)  printf("%s\n", X)

int main() {
    char* lol = ft_strdup("Hello world!");
    uint64_t len =  ft_strlen(lol);
    char* tmp = malloc(sizeof(uint8_t) * (len + 1));

    LOG(ft_strcpy(tmp, lol));
    LOG(lol);

    LOG(ft_strcpy(tmp, ""));
    LOG(lol);

    assert(ft_strcmp("42a\0", "42ai\0") < 0);

    ft_write(STDOUT_FILENO, lol, len);
    ft_write(STDOUT_FILENO, "\n", 1);
int new_len  = len;
    while (ft_read(STDIN_FILENO, tmp, len) != 0)
    {
         ft_write(STDOUT_FILENO, tmp, new_len);
        tmp[new_len] = 0;
    }

    free(lol);
    free(tmp);
    return 0;
}