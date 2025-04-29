{pkgs, ...}: {
  stylix = {
    enable = true;
    autoEnable = true;
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-frappe.yaml";
    image = ../assets/wallpapers/goldenglow-wallpaper.png; # this doesn't do anything if the hyprpaper module is enabled but is required to be set

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

