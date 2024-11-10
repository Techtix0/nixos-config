{pkgs, ...}:

{
	imports = [
		./formatters/stylua.nix
	];

	environment.systemPackages = [
		pkgs.lua-language-server
	];
}
