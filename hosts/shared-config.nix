{
  config,
  pkgs,
  lib,
  systemSettings,
  userSettings,
  ...
}: {
  imports = [];

  options = {};

  config = {
    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
      vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
      git
      pulseaudio # Needed to get the `pactl` cli tool while using pipewire
      clang # C compiler
      age # encryption tool
      sops # secret manaing tool
      onefetch # git information fetch tool like fastfetch/neofetch
      jq # command line json processor (needed for a sound switching script)
      xfce.thunar # File explorer
    ];

    # Secret management
    sops.defaultSopsFile = ./secrets/secrets.yaml;
    sops.defaultSopsFormat = "yaml";
    sops.age.keyFile = "/home/${userSettings.username}/.config/sops/age/keys.txt";

    # Set default shell
    users.defaultUserShell = pkgs.zsh;
    programs.zsh.enable = true;

    # Docker
    virtualisation.docker.enable = true;
		users.extraGroups.docker.members = [ "${userSettings.username}" ];

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

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

    # Enable the KDE Plasma Desktop Environment.
    services.displayManager.sddm.enable = true;
    services.desktopManager.plasma6.enable = true;

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

    # Fonts
    fonts.packages = with pkgs; [
      nerd-fonts.fira-mono
      nerd-fonts.symbols-only
    ];

    # Removes unwanted KDE packages
    environment.plasma6.excludePackages = with pkgs.kdePackages; [
      kwalletmanager # TODO - currently dissabled it in ~/.config/kwalletrc
      konsole
    ];

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
  };
}
