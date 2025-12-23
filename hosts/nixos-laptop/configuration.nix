# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../shared-config.nix # common configurations
    ../../modules/tmux # Terminal multiplexer
    ../../modules/services/lsp/nixd.nix # Nix lsp and formatter
    ../../modules/utility/virtualbox.nix # PC emulator
    ../../modules/services/lsp # Language servers and formatters
  ];

  options = {};

  config = {
    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
      firefox # Browser
      teams-for-linux # Microsoft teams
      iwgtk # Network managment GUI
      brightnessctl # Monitor brightness control
      vesktop # Discord wrapper
      vscodium # code editor
      pw3270 # 3270 emulator
      libreoffice # Office software
    ];

    # Touchpad behavior
    # For hyprland specifically, this has to be set in its own configuration
    services.libinput.touchpad.naturalScrolling = true;

    # Enable hyprland
    programs.hyprland.enable = true;

    # Networking configuration
    networking = {
      wireless.iwd = {
        enable = true;
        settings = {
          IPv6.enabled = true;
          Settings.Autoconnect = true;
        };
      };
      networkmanager.enable = true;
      networkmanager.wifi.backend = "iwd";
    };

    # Enable the X11 windowing system.
    # You can disable this if you're only using the Wayland session.
    services.xserver.enable = true;

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "25.05"; # Did you read the comment?
  };
}
