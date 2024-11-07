{pkgs, lib, inputs, userSettings, systemSettings, ...}: 

{
  home.packages = [pkgs.hyprlock];
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
      disable_loading_bar = true;
      grace = 5;
      hide_cursor = true;
      no_fade_in = false;
      };

      background = [
        {
          path = "~/Wallpapers/mangaPIP1.jpg";
          blur_passes = 0;
          # blur_size = 0;
        }
      ];

      input-field = [
        {
          size = "200, 50";
          position = "0, -480";
          monitor = systemSettings.monitor1;
          dots_center = true;
          fade_on_empty = false;
          font_color = "rgb(202, 211, 245)";
          inner_color = "rgb(91, 96, 120)";
          outer_color = "rgb(24, 25, 38)";
          outline_thickness = 3;
          placeholder_text = "<i>Input Password...</i>";
          shadow_passes = 1;
        }
      ];

      label = [
        {
          monitor = "HDMI-A-1";
          text = "Hi there, ${userSettings.username}";
          text_align = "center"; # center/right or any value for default left. multi-line text alignment inside label container
          color = "rgba(24, 25, 38, 1.0)";
          font_size = 30;
          font_family = "Noto Sans";
          rotate = 0; # degrees, counter-clockwise

          position = "0, 480";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}