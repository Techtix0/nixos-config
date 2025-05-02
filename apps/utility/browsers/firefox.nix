{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [];

  options = {};

  config = {
		programs.firefox = {
			enable = true;
			profiles = {
				default = {
					id = 0;
					isDefault = true;
					settings = {};
					search = {};
					extensions = {};
				};
			};
		};
	};
}
