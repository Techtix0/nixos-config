{
  pkgs,
  lib,
  systemSettings,
	userSettings,
  ...
}: {
  home.packages = [pkgs.hyprpaper];
  services.hyprpaper = {
    enable = true;
    settings = {
			# Disables splash text on the bottom of the screen
			splash = false;

      preload = [
        "${userSettings.dotfilesDir}/assets/wallpapers/nixos-wallpaper.png"
        "${userSettings.dotfilesDir}/assets/wallpapers/girls_at_pier-blue.jpg"
      ];

      wallpaper = [
				{
      	  monitor = "${systemSettings.monitor1}"; 
					path = "${userSettings.dotfilesDir}/assets/wallpapers/girls_at_pier-blue.jpg";
				}
				{
      	  monitor = "${systemSettings.monitor2}";
					path = "${userSettings.dotfilesDir}/assets/wallpapers/girls_at_pier-blue.jpg";
				}
				{
      	  monitor = "${systemSettings.laptop-monitor}";
					path = "${userSettings.dotfilesDir}/assets/wallpapers/nixos-wallpaper.png";
				}
      ];
    };
  };

  # Disables stylix from setting the wallpaper
  stylix.targets.hyprpaper.enable = lib.mkForce false;
}
