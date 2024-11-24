{
  description = "Tech's NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    stylix.url = "github:danth/stylix";

    vesktop-nix = {
      url = "github:PierreBorine/vesktop-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    # ---- SYSTEM SETTINGS ---- #
    systemSettings = {
      system = "x86_64-linux"; # system arch
      hostname = "nixos"; # hostname
      timezone = "Europe/Brussels"; # select timezone
      locale = "en_US.UTF-8"; # select locale
      monitor1 = "HDMI-A-1"; # primary monitor
      monitor2 = "DP-1"; # secondary monitor
    };

    # ----- USER SETTINGS ----- #
    userSettings = {
      username = "techtix"; # username
      name = "Techtix"; # name/identifier
      dotfilesDir = "/home/${userSettings.username}/.dotfiles"; # absolute path of the local repo
     # font = "Intel One Mono"; # Selected font
     # fontPkg = pkgs.intel-one-mono; # Font package
    };

    system = systemSettings.system;
    lib = nixpkgs.lib;
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        modules = [
          ./configuration.nix
          inputs.stylix.nixosModules.stylix
        ];
        specialArgs = {
          inherit systemSettings;
          inherit userSettings;
          inherit inputs;
        };
      };
    };

    homeConfigurations = {
      techtix = home-manager.lib.homeManagerConfiguration {
        modules = [
          ./home.nix
          inputs.stylix.homeManagerModules.stylix
        ];
        inherit pkgs;
        extraSpecialArgs = {
          inherit systemSettings;
          inherit userSettings;
          inherit inputs;
        };
      };
    };
  };
}
