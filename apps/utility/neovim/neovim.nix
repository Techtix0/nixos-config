{...}: {
  imports = [
    ./ripgrep.nix
    ./treesitter.nix
		./nvim-nio.nix
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
  };
}
