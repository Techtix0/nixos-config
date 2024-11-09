{pkgs, lib, ...}:

{
  imports = [
    ./ripgrep.nix
    ./treesitter.nix
  ];

  config = {
    programs.neovim ={
      enable = true;
      defaultEditor = true;

      extraLuaConfig = builtins.readFile ./init.lua;
    };
  };
}
