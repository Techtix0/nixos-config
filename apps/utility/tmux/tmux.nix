{config, pkgs, lib, ...}:
{
    imports = [];

    options = {};

    config = {
			programs.tmux = {
				enable = true;
			};
		};
}
