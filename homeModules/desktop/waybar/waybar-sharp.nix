{lib, userSettings, ...}: {
  programs.waybar = {
    enable = true;
    systemd = {
      enable = false; # autostart via hyprland conf
      target = "graphical-session.target";
    };

    style = lib.mkForce ./waybar-sharp.css;

    settings = lib.mkForce [
      {
        layer = "top";
        position = "top";
        margin-top = 4;
        margin-left = 8;
        margin-right = 8;
        margin-bottom = 0;

        modules-left = [
          "custom/launcher"
          "hyprland/workspaces"
          "hyprland/window"
        ];
        modules-center = [
          "clock"
        ];
        modules-right = [
          ""
          "privacy"
					"backlight"
          "wireplumber"
          "temperature"
          "network"
					"battery"
          "custom/poweroff"
        ];

        "custom/launcher" = {
          format = "";
          on-click = "fuzzel";
          tooltip = false;
        };

        "hyprland/workspaces" = {
          format = "{windows}";
          window-rewrite-default = "";
          window-rewrite = {
            "kitty" = "";
            "dolphin" = "";
            "vesktop" = "";
            "obsidian" = " 󰈙";
            "spotify" = "";
            "steam" = "";
            "minecraft" = "󰍳";
            "class<firefox>" = "󰈹";
						"godot" = "";
          };
        };

        "clock" = {
          format = " [ {:%H:%M %a} ] ";
          tooltip = true;
          tooltip-format = "{:%Y-%m-%d}";
        };

        "hyprland/window" = {
          format = " {title}";
          rewrite = {
            "(.*) — Mozilla Firefox" = "$1";
            "(.*) - Obsidian v.\..\.." = "$1";
          };
          separate-outputs = true;
        };

				"battery" = {
					format = " [ {icon} {capacity}% ] ";
					format-icons = ["󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"]; 
				};

        "custom/poweroff" = {
          format = "";
          on-click = "wlogout";
          tooltip = false;
        };

        "wireplumber" = {
          format = " [ {icon} {volume}% ] ";
          format-muted = " [ 󰖁 {volume}% ] ";
          format-icons = ["󰕾"];
					on-click = "bash " + userSettings.dotfilesDir + "/scripts/audio-switcher.sh";
          tooltip = true;
        };

				"backlight" = {
					format = " [ {icon} {percent}% ] ";
					format-icons = ["󰃞" "󰃟" "󰃠"];
				};

        "temperature" = {
          format = " [  {temperatureC}°C ] ";
          hwmon-path = "/sys/class/hwmon/hwmon3/temp3_input";
          interval = 4;
          tooltip = false;
        };

        "network" = {
          format = " [   ] ";
          format-disconnected = " [ 󱘖  ] ";
					on-click = "iwgtk";
          tooltip-format-ethernet = "{ifname} via {gwaddr}";
          tooltip-format-disconnected = "disconnected";
        };

        "privacy" = {
          icon-size = 13;
        };
      }
    ];
  };
}
