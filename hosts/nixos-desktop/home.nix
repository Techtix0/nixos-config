{
  config,
  pkgs,
  userSettings,
  inputs,
	lib,
  ...
}: let
in {
  imports = [
    # TODO - put imports in a default.nix
    ../../homeModules/desktop/style/stylix.nix # Strylix settings
    ../../homeModules/terminal # Terminal and shell configs
    ../../homeModules/utility/fuzzel.nix # application launcher
    ../../homeModules/utility/ranger.nix # CLI file manager
    ../../homeModules/desktop/wm/hyprland/hyprland-sharp.nix # Window manager, sharp corners
    ../../homeModules/desktop/waybar/waybar-sharp.nix # waybar config, sharp corners
    ../../homeModules/utility/git.nix # git/github config
    ../../homeModules/utility/neovim/neovim.nix # neovim config
		../../homeModules/utility/browsers # web browsers
		../../homeModules/media/music # music player config
		../../homeModules/desktop/quickshell # quickshell config
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

    # Secret management
    sops = {
      defaultSopsFile = ../../secrets/secrets.yaml;
      defaultSopsFormat = "yaml";
      age.keyFile = "/home/${userSettings.username}/.config/sops/age/keys.txt";
    };

    # The home.packages option allows you to install Nix packages into your
    # environment.
    home.packages = with pkgs; [
      bitwarden-desktop # password manager
      btop # resource monitor
      cava #	audio visualizer
      fastfetch #	system information
      feh #	image viewer
      grim #	screenshot tool for wayland
      hyprlang #	config language for hyprland
      killall #	kill all instances of a process
      obsidian #	note taking app
      todo #	REMOVE
      slurp #	get coordinates for selected location on screen (used with grim)
      wlogout #	gui start menu
      ani-cli # watch anime from the cli
    ];

    # Home Manager is pretty good at managing dotfiles. The primary way to manage
    # plain files is through 'home.file'.
    home.file = {
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
      # EDITOR = "nvim";  # Neovim is already set as default in ./homeModules/neovim/neovim.nix
    };

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;

    nixpkgs.config.allowUnfree = true;

    programs.btop.enable = true;
  };
}
