{
  config,
  pkgs,
  lib,
  ...
}: {
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
        margin-top = 7;
        margin-left = 10;
        margin-right = 10;

        modules-left = [
          "custom/launcher"
          "hyprland/workspaces"
					"custom/spacer"
          "hyprland/window"
        ];
        modules-center = [
          "clock"
        ];
        modules-right = [
          ""
          "privacy"
          "wireplumber"
          "custom/temperature-icon"
          "temperature"
          "network"
          "custom/poweroff"
        ];

        "custom/launcher" = {
          format = "󱄅";
          on-click = "fuzzel";
          tooltip = false;
        };

        "hyprland/workspaces" = {
          format = "{windows}";
          format-window-seperator = "\n";
          window-rewrite-default = "";
          window-rewrite = {
            "kitty" = "";
            "dolphin" = "";
            "vesktop" = "";
            "obsidian" = "󰈙";
            "spotify" = "";
            "steam" = "";
            "minecraft" = "󰍳";
            "class<firefox>" = "󰈹";
          };
        };

				"custom/spacer" = {
					format = "  ";
				};

        "clock" = {
          format = "{:%H:%M %a}";
          tooltip = true;
          tooltip-format = "{:%Y-%m-%d}";
        };

        "hyprland/window" = {
          format = "{title}";
          rewrite = {
            "(.*) — Mozilla Firefox" = "$1";
						"(.*) - Obsidian v.\..\.." = "$1";
          };
          separate-outputs = true;
        };

        "custom/poweroff" = {
          format = "";
          on-click = "wlogout";
          tooltip = false;
        };

        "wireplumber" = {
          format = "{icon} {volume}%";
          format-muted = "󰖁 {volume}%";
          format-icons = ["󰕾"];
          tooltip = false;
        };

        "custom/temperature-icon" = {
          format = "";
          tooltip = false;
        };

        "temperature" = {
          format = "{temperatureC}°C";
          hwmon-path = "/sys/class/hwmon/hwmon3/temp3_input";
          interval = 4;
          tooltip = false;
        };

        "network" = {
          format = " ";
          format-disconnected = "󱘖 ";
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
