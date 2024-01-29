/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_atoi_base.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: etran <etran@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/02/22 12:52:53 by etran             #+#    #+#             */
/*   Updated: 2024/01/29 15:38:47 by etran            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

int		len(char *base)
{
	int i;

	i = 0;
	while (base[i])
		i++;
	return (i);
}

int isWs(char c) {
	return (c == ' ' || c == '\t' ||
	c == '\n' || c == '\v' || c == '\f' ||
	c == '\r');
}

int isSign(char c) {
	return (c == '+' || c == '-');
}



int		isCharset(char c, char *base)
{
	int i;

	i = 0;
	while (base[i])
	{
		if (c == base[i])
			return (i);
		i++;
	}
	return (-1);
}


int		ft_convert(char *str, char *base)
{
	int sign;
	int output;
	int base_length = len(base);

	sign = 1;
	output = 0;
	while (*str && isSign(*str))
	{
		if (*str == '-')
			sign = -sign;
		++str;
	}
	while (*str)
	{
		int val = isCharset(*str, base);
		if (val < 0)
			break;
		output = (output * base_length) + val;
		++str;
	}
	return (sign * output);
}






// DONE
int		valid(char *base)
{
	int i;
	int j;

	i = 0;
	while (base[i])
	{
		if (isSign(base[i]))
			return (0);
		j = i + 1;

		while (base[j])
		{
			if (base[i] == base[j] || isWs(base[j]))
				return (0);
			++j;
		}

		++i;
	}
	if (i < 2)
		return 0;
	return (1);
}












int		ft_atoi_base(char *str, char *base)
{
	if (!valid(base))
		return (0);

	while (*str && isWs(*str))
		++str;
	return (ft_convert(str, base));
}

#include <stdio.h>
int main(int ac, char** av) {
	if (ac != 3)
		return 1;
	printf("%d\n", ft_atoi_base(av[1],av[2]));
	return 0;
}