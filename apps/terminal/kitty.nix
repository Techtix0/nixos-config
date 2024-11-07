{config, lib, pkgs, ...}:

{
  home.packages = [pkgs.kitty];
  programs.kitty = {
    enable = true;
    settings = {
      enable_audio_bell = false;
    };
  };
}