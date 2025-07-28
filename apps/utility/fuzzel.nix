{config, lib, pkgs, ...}:

{
  home.packages = [pkgs.fuzzel];
  programs.fuzzel = {
    enable = true;
    settings = {
			main = {
				lines = 10;
				width = 15;
				tabs = 4;
			};
			border = {
				width = 2;
				radius = 0;
			};
    };
  };
}
