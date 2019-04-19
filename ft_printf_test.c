void ft_printf(const char *format, ...);

int		main(void)
{
	while (1)
	{
		ft_printf("%*s %-*s %*s %-*s %*s %-*s\n"
				, 30, "oui bonjour les gens"
				, 30, "oui bonjour les gens"
				, 30, "ok"
				, 30, "ok"
				, 30, "ah oui bonjour les supers gens"
				, 30, "ah oui bonjour les supers gens");
	}
	return (0);
}
