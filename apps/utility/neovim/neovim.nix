{lib, ...}:

{
  programs.neovim ={
    enable = true;
    defaultEditor = true;

    extraLuaConfig = (builtins.readFile ./init.lua) + (builtins.readfile ./lua/treesitter.lua);

    # plugins = with pkgs.vimPlugins; [
    #   telescope-nvim
    # ];
  };
}
