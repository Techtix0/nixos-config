{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [];

  options = {};

  config = {
		# Check out tmuxifier for session "blueprints"
		# https://youtu.be/_YaI2vDbk0o?si=oVur46cVSeYmogrz
    programs.tmux = {
      enable = true;
      shortcut = "C-a";

      plugins = with pkgs.tmuxPlugins; [
				vim-tmux-navigator
      ];

      extraConfig = lib.readFile ./tmux.conf;
    };
  };
}
