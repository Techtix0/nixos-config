{pkgs, lib, inputs, userSettings, systemSettings, ...}: 

{
	stylix.targets.hyprlock.enable = false;

  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
				disable_loading_bar = true;
      	hide_cursor = true;
      	no_fade_in = false;
      };

      background = [
        {
					color = "rgb(0, 0, 0)";
          blur_passes = 0;
        }
      ];

      input-field = [
        {
          size = "200, 50";
          position = "0, 0";
          dots_center = true;
          fade_on_empty = true;
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
					text = "cmd[update:1000] date +'%H:%M'";
					text_align = "center";
          color = "rgb(205, 214, 244)";
          font_size = 30;
          font_family = "Noto Sans";
          rotate = 0; # degrees, counter-clockwise

          position = "0, 550";
          halign = "center";
          valign = "center";
				}
        {
          text = "Hi there, ${userSettings.username}";
          text_align = "center"; # center/right or any value for default left. multi-line text alignment inside label container
          color = "rgb(205, 214, 244)";
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
