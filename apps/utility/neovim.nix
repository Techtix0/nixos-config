{config, pkgs, lib, ...}:

{
  programs.neovim ={
    enable = true;
    defualtEditor = true;

    extraConfig = "
      set number
    ";


  };
}