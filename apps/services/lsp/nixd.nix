{pkgs, ...}:

{
	imports = [
		./formatters/alejandra.nix
	];
	environment.systemPackages = [
		pkgs.nixd
	];
}
