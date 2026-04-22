{pkgs, ...}: {
	imports = [];

	environment.systemPackages = [
		pkgs.python313Packages.python-lsp-server
	];
}
