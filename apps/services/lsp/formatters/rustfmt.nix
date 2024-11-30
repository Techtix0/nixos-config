{pkgs, ...}:

{
	environment.systemPackages = [
		pkgs.rustfmt
	];
};
