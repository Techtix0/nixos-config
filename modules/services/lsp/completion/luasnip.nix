{pkgs, ...}:
{
	environment.systemPackages = [
		pkgs.vimPlugins.luasnip
	];
}
