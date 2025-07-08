{
  config,
  pkgs,
  lib,
	systemSettings,
  ...
}: {
  imports = [];

  options = {};

  config = {
		environment.systemPackages = [quickshell.packages.${systemSettings.system}.default];
	};
}
