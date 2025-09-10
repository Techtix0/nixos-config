{pkgs, ...}:

{
	imports = [
		./formatters/rustfmt.nix
	];

	environment.systemPackages = [
		pkgs.rust-analyzer
	];
}
