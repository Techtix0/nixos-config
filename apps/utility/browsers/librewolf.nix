{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [];

  options = {};

  config = {
    programs.librewolf = {
			enable = true;

			settings = {
				"toolkit.legacyUserProfileCustomizations.stylesheets" = true;
			};
    };
  };
}
