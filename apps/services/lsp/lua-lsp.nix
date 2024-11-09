{pkgs, ...}:

{
	environment.systemPackages = [
		pkgs.lua-language-server
	];
}
