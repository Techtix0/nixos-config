{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [];

  options = {};

  config = {
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
