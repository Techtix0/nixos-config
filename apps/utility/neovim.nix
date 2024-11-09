{config, pkgs, lib, ...}:

{
  programs.neovim ={
    enable = true;
    defaultEditor = true;

    extraConfig = "
      set number
    ";
  };
}