{
  config,
  pkgs,
  lib,
  ...
}: let
  aagl = import (builtins.fetchTarball "https://github.com/ezKEa/aagl-gtk-on-nix/archive/release-25.05.tar.gz");
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
