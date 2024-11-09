{lib, ...}:

{
  programs.neovim ={
    enable = true;
    defaultEditor = true;

    extraLuaConfig = builtins.readFile ./init.lua;
  };
}
