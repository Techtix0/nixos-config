{config, lib, pkgs, ...}:

{
  home.packages = [pkgs.kitty];
  programs.kitty = {
    enable = true;
		font.size = lib.mkForce 10;
    settings = {
      enable_audio_bell = false;
    };
  };
}
