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
        "~/.dotfiles/assets/wallpapers/goldenglow-wallpaper.png"
        "~/.dotfiles/assets/wallpapers/girls_at_pier-blue.jpg"
      ];

      wallpaper = [
        "${systemSettings.monitor1}, ~/.dotfiles/assets/wallpapers/girls_at_pier-blue.jpg"
        "${systemSettings.monitor2}, ~/.dotfiles/assets/wallpapers/girls_at_pier-blue.jpg"
      ];
    };
  };

  # Disables stylix from setting the wallpaper
  stylix.targets.hyprpaper.enable = lib.mkForce false;
}
