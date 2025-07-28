{config, lib, pkgs, ...}:

{
  home.packages = [pkgs.fuzzel];
  programs.fuzzel = {
    enable = true;
    settings = {
			border = {
				radius = 0;
			};
    };
  };
}
