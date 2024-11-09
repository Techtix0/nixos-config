{config, pkgs, lib, ...}:

{
  programs.neovim ={
    enable = true;
    defaultEditor = true;

    extraConfig = builtins.toPath "./init.lua";

    plugins = with pkgs.vimPlugins; [
      telescope-nvim
    ];
  };
}