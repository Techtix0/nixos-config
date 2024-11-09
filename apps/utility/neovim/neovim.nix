{config, pkgs, lib, userSettings, ...}:

{
  programs.neovim ={
    enable = true;
    defaultEditor = true;

    # extraConfig = builtins.readFile (userSettings.dotfilesDir + "/apps/utility/neovim/init.lua");
    extraConfig = builtins.readFile ./init.lua;

    plugins = with pkgs.vimPlugins; [
      telescope-nvim
    ];
  };
}