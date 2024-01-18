/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: etran <etran@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/01/12 17:02:07 by etran             #+#    #+#             */
/*   Updated: 2024/01/18 18:37:46 by etran            ###   ########.fr       */
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

uint64_t    ft_strlen(char const* str);
char*       ft_strcpy(char* dst, char const* src);
char*       ft_strdup(char const* src);
int         ft_strcmp(const char *s1, const char *s2);

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

    free(lol);
    free(tmp);
    return 0;
}