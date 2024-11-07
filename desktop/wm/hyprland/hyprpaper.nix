{pkgs, lib, inputs, systemSettings, ...}: 

{
  home.packages = [pkgs.hyprpaper];
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "~/.dotfiles/assets/wallpapers/mangaPIP1.jpg"
        "~/.dotfiles/assets/wallpapers/goldenglow-wallpaper.png"
      ];

      wallpaper = [
        "${systemSettings.monitor1}, ~/.dotfiles/assets/wallpapers/goldenglow-wallpaper.png"
        "${systemSettings.monitor2}, ~/.dotfiles/assets/wallpapers/goldenglow-wallpaper.png"
      ];
    };
  };
}