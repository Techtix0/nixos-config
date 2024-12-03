{
  config,
  pkgs,
  userSettings,
  inputs,
  ...
}: let
in {
  imports = [
    # TODO - put imports in a default.nix
    ./style/stylix.nix # Strylix settings
    # ./apps/terminal/bash.nix  # Bash config
    ./apps/terminal/sh.nix # Shell scripts
    ./apps/terminal/kitty.nix # terminal
    ./apps/utility/fuzzel.nix # application launcher
    ./apps/utility/ranger.nix # CLI file manager
    ./desktop/wm/hyprland/hyprland.nix # Window manager (also includes imports for hyprlock and hyprpaper)
    ./desktop/waybar/waybar.nix # waybar config
    ./apps/utility/git.nix # git/github config
    ./apps/utility/neovim/neovim.nix # neovim config
    ./apps/media/discord/vesktop.nix # vesktop config
		./apps/media/spotify/spotify.nix # spicetify config	
  ];

  options = {};

  config = {
    # Home Manager needs a bit of information about you and the paths it should
    # manage.
    home.username = userSettings.username;
    home.homeDirectory = "/home/" + userSettings.username;

    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    home.stateVersion = "24.11"; # Please read the comment before changing.

    # The home.packages option allows you to install Nix packages into your
    # environment.
    home.packages = with pkgs; [
      bitwarden-desktop	# password manager
      btop	# resource monitor
      cava	#	audio visualizer 
      fastfetch	#	system information 
      feh	#	image viewer 
      firefox	#	browser 
      grim	#	screenshot tool for wayland 
      hyprlang	#	config language for hyprland 
      killall	#	kill all instances of a process 
      nerdfonts	#	cool icons
      obsidian	#	note taking app 
      tree-sitter # Downloads the grammar packages which the Lazy.nvim package manager for neovim doesn't do. Allows for better syntax highlighting.
      todo	#	REMOVE 
      slurp	#	get coordinates for selected location on screen (used with grim) 
      vscode	#	visual studio code (backup for when neovim doesn't cut it) 
      wlogout	#	gui start menu 
    ];

    # Home Manager is pretty good at managing dotfiles. The primary way to manage
    # plain files is through 'home.file'.
    home.file = {
      #	Neovim config files for init.lua
      ".config/nvim/lua" = {
        source = ./apps/utility/neovim/lua;
        recursive = true;
      };
    };

    # Home Manager can also manage your environment variables through
    # 'home.sessionVariables'. These will be explicitly sourced when using a
    # shell provided by Home Manager. If you don't want to manage your shell
    # through Home Manager then you have to manually source 'hm-session-vars.sh'
    # located at either
    #
    #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
    #
    # or
    #
    #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
    #
    # or
    #
    #  /etc/profiles/per-user/techtix/etc/profile.d/hm-session-vars.sh
    #
    home.sessionVariables = {
      # EDITOR = "nvim";  # Neovim is already set as default in ./apps/neovim/neovim.nix
    };

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;

    nixpkgs.config.allowUnfree = true;

    programs.btop.enable = true;
  };
}
