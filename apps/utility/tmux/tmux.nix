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
      shortcut = "a";

      plugins = with pkgs.tmuxPlugins; [
      ];

      extraConfig = lib.readFile ./tmux.conf;
    };
  };
}
