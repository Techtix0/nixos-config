# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  lib,
  pkgs,
  systemSettings,
  userSettings,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix # Include the results of the hardware scan.
    ../shared-config.nix # common configurations
    ../../modules/services/lsp # language servers
    ../../modules/games # game configs
    ../../modules/openrgb/openrgb.nix # openrgb config
    ../../modules/tmux # tmux config
  ];

  options = {};

  config = {
    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
      nixVersions.latest # Latest version of the nix language grabbed from nixpkgs
      linuxKernel.packages.linux_zen.xone
      openssh #	ssh client
      cbonsai # terminal screen saver
      vesktop # discord client
      vlc # media player
      godot # Game engine
      aseprite # Pixel art tool
      protonvpn-gui # VPN
      wireguard-tools # Wireguard tools
      (callPackage ../../derivations/zlibrary.nix {}) # Z-library
    ];

    # Enables xone, driver for xbox controller.
    hardware.xone.enable = true;

    boot = {
      # This removes the phantom display (unknown-1)
      kernelParams = [
        # Nvidia framebuffer.
        "nvidia-drm.fbdev=1"
      ];
    };

    # Enable the X11 windowing system.
    # You can disable this if you're only using the Wayland session.
    services.xserver.enable = false;

    # Set environment variables
    # environment.sessionVariables = {};

    # Needed for protonVPN
    networking.firewall.checkReversePath = false;

    # Enable hyprland
    programs.hyprland.enable = true;

    # Enables ssh into system
    services.openssh = {
      enable = true;
      ports = [23];
    };

    #	Steam install
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    };

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "24.11"; # Did you read the comment?
  };
}
