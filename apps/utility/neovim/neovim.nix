{...}: {
  imports = [
    ./ripgrep.nix
    ./treesitter.nix
  ];

  config = {
    #	Disables stylix from targeting neovim
    stylix.targets.neovim.enable = false;

    # Neovim config
    programs.neovim = {
      enable = true;
      defaultEditor = true;

      extraLuaConfig = builtins.readFile ./init.lua;
    };

    home.file = {
      #	Neovim config files for init.lua
      ".config/nvim/lua" = {
        source = ./lua;
        recursive = true;
      };
    };

  };
}
