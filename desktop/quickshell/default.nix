{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [];

  options = {};

  config = {
		home.file = {
			".config/quickshell/shell.qml" = {
				source = ./example.qml;
			};
		};
	};
}
