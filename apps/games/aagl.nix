{
  config,
  pkgs,
  lib,
  ...
}: let
  aagl = import (builtins.fetchTarball {
		url = "https://github.com/ezKEa/aagl-gtk-on-nix/archive/release-25.05.tar.gz";
		sha256 = "sha256:1ibx1q0idrnin70dsp3brqzd432b2xd0vg3pz1l31v8afzlg7rp2";
		}
	);
in {
  imports = [
		aagl.module
	];

  options = {};

  config = {
		nix.settings = aagl.nixConfig; # Set up Cachix
	  programs.anime-game-launcher.enable = true;
	  programs.anime-games-launcher.enable = true;
	};
}
