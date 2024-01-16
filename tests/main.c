/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: etran <etran@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/01/12 17:02:07 by etran             #+#    #+#             */
/*   Updated: 2024/01/16 17:07:43 by etran            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

/**
 * This is a test main.
*/
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

uint64_t    ft_strlen(char const* str);
char*       ft_strcpy(char* dst, char const* src);
char*       ft_strdup(char const* src);

#define LOG(X)  printf("%s\n", X)

int main() {
    char* lol = ft_strdup("Hello world!");
    uint64_t len =  ft_strlen(lol);
    char* tmp = malloc(sizeof(uint8_t) * (len + 1));

    ft_strcpy(tmp, lol);

    LOG(tmp);

    free(lol);
    free(tmp);
    return 0;
}