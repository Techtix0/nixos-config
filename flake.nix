{
  description = "Tech's NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
		nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

		sops-nix.url = "github:Mic92/sops-nix";

    stylix = {
			url = "github:nix-community/stylix/release-25.11";
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
      # hostname = "nixos-desktop"; # hostname
      timezone = "Europe/Brussels"; # select timezone
      locale = "en_US.UTF-8"; # select locale
      monitor1 = "HDMI-A-1"; # primary monitor
      monitor2 = "DP-2"; # secondary monitor
			laptop-monitor = "eDP-1"; # laptop display
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
      nixos-desktop = lib.nixosSystem {
        modules = [
          ./hosts/nixos-desktop/configuration.nix
          inputs.stylix.nixosModules.stylix
					inputs.sops-nix.nixosModules.sops
					{networking.hostName = "nixos-desktop";}
        ];
        specialArgs = {
          inherit systemSettings;
          inherit userSettings;
          inherit inputs;
        };
      };
    };

    nixosConfigurations = {
      nixos-laptop = lib.nixosSystem {
        modules = [
          ./hosts/nixos-laptop/configuration.nix
          inputs.stylix.nixosModules.stylix
					inputs.sops-nix.nixosModules.sops
					{networking.hostName = "nixos-laptop";}
        ];
        specialArgs = {
          inherit systemSettings;
          inherit userSettings;
          inherit inputs;
        };
      };
    };

    homeConfigurations = {
      "techtix@nixos-desktop" = home-manager.lib.homeManagerConfiguration {
        modules = [
          ./hosts/nixos-desktop/home.nix
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

      "techtix@nixos-laptop" = home-manager.lib.homeManagerConfiguration {
        modules = [
          ./hosts/nixos-laptop/home.nix
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
