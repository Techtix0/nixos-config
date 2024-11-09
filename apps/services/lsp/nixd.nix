{pkgs, ...}:

{
	environment.systemPackages = [
		pkgs.nixd
	];
}
