/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: etran <etran@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/01/12 17:02:07 by etran             #+#    #+#             */
/*   Updated: 2024/01/16 14:56:22 by etran            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

/**
 * This is a test main.
*/
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

uint64_t ft_strlen(char const* str);

int main() {
    char* lol = strdup("Hello world!");
    printf("%lu\n", ft_strlen(lol));
    free(lol);
    return 0;
}