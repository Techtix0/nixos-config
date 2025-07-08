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
    ./apps/services/lsp # language servers
		./apps/games # game configs
		./style # style config 
		./apps/utility/tmux # tmux config
		./desktop/quickshell # quickshell config
  ];

  options = {
	};

  config = {
		# Secret management
		sops.defaultSopsFile = ./secrets/secrets.yaml;
		sops.defaultSopsFormat = "yaml";
		sops.age.keyFile = "/home/${userSettings.username}/.config/sops/age/keys.txt";

		# Set default shell
		users.defaultUserShell = pkgs.zsh;
		programs.zsh.enable = true;

		# Enables xone, driver for xbox controller.
		hardware.xone.enable = true;

    # services.upower.enable = true;
    # nixpkgs.overlays = [
    #   (final: prev:
    #   {
    #     ags = prev.ags.overrideAttrs (old: {
    #       buildInputs = old.buildInputs ++ [ pkgs.libdbusmenu-gtk3 ];
    #     });
    #   })
    # ];

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot = {
      # This removes the phantom display (unknown-1)
      kernelParams = [
        # Nvidia framebuffer.
        "nvidia-drm.fbdev=1"
      ];
    };

    networking.hostName = systemSettings.hostname; # Define your hostname.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Enable networking
    networking.networkmanager.enable = true;

    # Set your time zone.
    time.timeZone = systemSettings.timezone;

    # Select internationalisation properties.
    i18n.defaultLocale = systemSettings.locale;

    i18n.extraLocaleSettings = {
      LC_ADDRESS = "nl_BE.UTF-8";
      LC_IDENTIFICATION = "nl_BE.UTF-8";
      LC_MEASUREMENT = "nl_BE.UTF-8";
      LC_MONETARY = "nl_BE.UTF-8";
      LC_NAME = "nl_BE.UTF-8";
      LC_NUMERIC = "nl_BE.UTF-8";
      LC_PAPER = "nl_BE.UTF-8";
      LC_TELEPHONE = "nl_BE.UTF-8";
      LC_TIME = "nl_BE.UTF-8";
    };

    # Enable the X11 windowing system.
    # You can disable this if you're only using the Wayland session.
    services.xserver.enable = true;

    # Enable the KDE Plasma Desktop Environment.
    services.displayManager.sddm.enable = true;
    services.desktopManager.plasma6.enable = true;

    # Configure keymap in X11
    # services.xserver.xkb = {
    #   layout = "us";
    #   variant = "";
    # };

    # Enable CUPS to print documents.
    services.printing.enable = true;

    # Enable sound with pipewire.
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };

    # Enable touchpad support (enabled default in most desktopManager).
    # services.xserver.libinput.enable = true;

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.${userSettings.username} = {
      isNormalUser = true;
      description = userSettings.name;
      extraGroups = ["networkmanager" "wheel"];
      packages = [];
    };

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # Set environment variables
    environment.sessionVariables = {
		 #GRIM_DEFAULT_DIR = /home/${userSettings.username}/Pictures/screenshots;
     #EDITOR = "nvim"; # Set default editor
    };

    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
      vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
      wget
      git # Version control
      home-manager
			nixVersions.latest # Latest version of the nix language grabbed from nixpkgs
			linuxKernel.packages.linux_zen.xone
			openssh #	ssh client 
			cbonsai # terminal screen saver
			age # encryption tool
			sops # secret manaing tool
			onefetch # git information fetch tool like fastfetch/neofetch
			zip 
			unzip # compression tools
			vesktop # discord client
			vlc # media player
			godot # Game engine
			aseprite # Pixel art tool
			jq # command line json processor
			protonvpn-gui # VPN
			wireguard-tools # Wireguard tools
    ];

		# Fonts
		fonts.packages = with pkgs; [
			nerd-fonts.fira-mono
			nerd-fonts.symbols-only
		];

		# Enables ssh into system
		services.openssh = {
			enable = true;
			ports = [ 23 ];
		};

    #	Steam install
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    };

    # Removes unwanted KDE packages
    environment.plasma6.excludePackages = with pkgs.kdePackages; [
      kwalletmanager # TODO - currently dissabled it in ~/.config/kwalletrc
      konsole
    ];

    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    # programs.mtr.enable = true;
    # programs.gnupg.agent = {
    #   enable = true;
    #   enableSSHSupport = true;
    # };

    # List services that you want to enable:

    # Enable the OpenSSH daemon.
    # services.openssh.enable = true;

		# Needed for protonVPN
		networking.firewall.checkReversePath = false;

    # Open ports in the firewall.
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    # networking.firewall.enable = false;

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "24.11"; # Did you read the comment?

    # Enable OpenGL
    hardware.graphics = {
      enable = true;
    };

    # Load nvidia driver for Xorg and Wayland
    services.xserver.videoDrivers = ["nvidia"];

    hardware.nvidia = {
      # Modesetting is required
      modesetting.enable = true;

      # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
      # Enable this if you have graphical corruption issues or application crashes after waking
      # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead of just
      # the bare essentials.
      powerManagement.enable = false;

      # Fine-frained power management. Turns off GPU when not in use.
      # Experimental and only works on modern Nvidia GPUs (Turing or newer).
      powerManagement.finegrained = false;

      # Use the Nvidia open source kernel module (not to be confused with the independent third-party "nouveau" open source driver).
      # Support is limited to the Turing and later architectures.
      # Only available from driver 515.43.04+
      # Currently alpha-quality/bugging, so false is currently the recommended setting.
      open = false;

      # Enable the Nvidia settings menu,
      # accessible via `nvidia-settings`.
      nvidiaSettings = true;

      # https://www.reddit.com/r/NixOS/comments/1cx9wsy/question_nvidia_555_beta_released_today/
      # Optionally, you may need to select the appropriate driver version of your specific GPU.
      # package = config.boot.kernelPackages.nvidiaPackages.stable;
      package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
        version = "570.153.02";

        sha256_64bit = "sha256-FIiG5PaVdvqPpnFA5uXdblH5Cy7HSmXxp6czTfpd4bY=";
        sha256_aarch64 = lib.fakeSha256;
        openSha256 = lib.fakeSha256;
        settingsSha256 = "sha256-vWnrXlBCb3K5uVkDFmJDVq51wrCoqgPF03lSjZOuU8M=";
        persistencedSha256 = lib.fakeSha256;
      };
    };

    # Enable flakes
    nix.settings.experimental-features = ["nix-command" "flakes"];

    # Enable hyprland
    programs.hyprland.enable = true;
    programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  };
}
