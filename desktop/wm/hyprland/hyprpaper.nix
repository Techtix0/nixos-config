{
  pkgs,
  lib,
  systemSettings,
  ...
}: {
  home.packages = [pkgs.hyprpaper];
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "~/.dotfiles/assets/wallpapers/mangaPIP1.jpg"
        "~/.dotfiles/assets/wallpapers/goldenglow-wallpaper.png"
				"~/.dotfiles/assets/wallpapers/some-girl.jpg"
      ];

      wallpaper = [
        "${systemSettings.monitor1}, ~/.dotfiles/assets/wallpapers/some-girl.jp"
        "${systemSettings.monitor2}, ~/.dotfiles/assets/wallpapers/some-girl.jpg"
      ];
    };
  };

  # Disables stylix from setting the wallpaper
  stylix.targets.hyprpaper.enable = lib.mkForce false;
}
