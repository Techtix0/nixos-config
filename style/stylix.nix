{config, pkgs, userSettings, ...}:

{
  stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    image = ../assets/wallpapers/goldenglow-wallpaper.png;
    
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 16;
      # https://github.com/ful1e5/notwaita-cursor
    };

    fonts = {
      monospace = {
        package = pkgs.fira-mono;
        name = "fira-mono";
      };

      sansSerif = {
        package = pkgs.fira;
        name = "fira";
      };

      serif = {
        package = pkgs.fira;
        name = "fira";
      };
    };
  };
}

# --Themes-- https://tinted-theming.github.io/base16-gallery/
# stella
# onedark
# tokyo-city-dark
# tokyo-night-terminal-dark
# catppuccin-mocha
