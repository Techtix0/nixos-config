{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [];

  options = {};

  config = {
		programs.rmpc = {
			enable = true;
		};
	};
}
