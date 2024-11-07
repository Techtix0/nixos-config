{config, pkgs, ...}:

{
  home.packages = [pkgs.ranger];
  programs.ranger = {
    enable = true;
    settings = {
      show_hidden = true;
    };
  };
}