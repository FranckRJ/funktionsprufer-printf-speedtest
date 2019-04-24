void ft_printf(const char *format, ...);

int		main(int argc, char **argv)
{
	char	enableStarOpt = '0';

	if (argc > 1 && argv[1][0] == '1')
		enableStarOpt = '1';

	if (enableStarOpt == '1')
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
	}
	else
	{
		while (1)
		{
			ft_printf("%30s %-30s %30s %-30s %30s %-30s\n"
					, "oui bonjour les gens"
					, "oui bonjour les gens"
					, "ok"
					, "ok"
					, "ah oui bonjour les supers gens"
					, "ah oui bonjour les supers gens");
		}
	}
	return (0);
}
