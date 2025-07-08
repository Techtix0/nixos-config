{
  config,
  pkgs,
  lib,
	quickshell,
	systemSettings,
  ...
}: {
  imports = [];

  options = {};

  config = {
		home.packages = [quickshell.packages.${systemSettings.system}.default];
		home.file = {
			".config/quickshell/shell.qml" = {
				source = ./example.qml;
			};
		};
	};
}
