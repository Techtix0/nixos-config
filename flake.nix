{
  description = "Tech's NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
		nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

		sops-nix.url = "github:Mic92/sops-nix";

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    stylix = {
			url = "github:danth/stylix/release-25.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		quickshell = {
			url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
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
		quickshell,
    ...
  } @ inputs: let
    # ---- SYSTEM SETTINGS ---- #
    systemSettings = {
      system = "x86_64-linux"; # system arch
      hostname = "nixos"; # hostname
      timezone = "Europe/Brussels"; # select timezone
      locale = "en_US.UTF-8"; # select locale
      monitor1 = "HDMI-A-1"; # primary monitor
      monitor2 = "DP-2"; # secondary monitor
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
					inputs.sops-nix.nixosModules.sops
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
          inputs.stylix.homeModules.stylix
					inputs.sops-nix.homeManagerModules.sops
					inputs.nur.modules.homeManager.default
        ];
        inherit pkgs;
        extraSpecialArgs = {
          inherit systemSettings;
          inherit userSettings;
          inherit inputs;
					inherit quickshell;
        };
      };
    };
  };
}
