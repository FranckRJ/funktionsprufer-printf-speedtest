#include <stdio.h>

int		main(void)
{
	while (1)
	{
		printf("%*s %-*s %*s %-*s %*s %-*s\n"
				, 30, "oui bonjour les gens"
				, 30, "oui bonjour les gens"
				, 30, "ok"
				, 30, "ok"
				, 30, "ah oui bonjour les supers gens"
				, 30, "ah oui bonjour les supers gens");
		fflush(stdout);
	}
	return (0);
}
