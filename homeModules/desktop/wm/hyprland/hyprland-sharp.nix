{
  pkgs,
  lib,
  inputs,
  systemSettings,
	userSettings,
  ...
}: {
  imports = [
    ./hyprpaper.nix
    ./hyprlock.nix
		./hypridle.nix
    ./wl-clipboard.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      # Waybar startup/refresh script
      exec-once = "~/.dotfiles/homeModules/desktop/waybar/startup.sh";

      # See https://wiki.hyprland.org/Configuring/Monitors/
      monitor = [
        "${systemSettings.monitor1}, 1920x1080@144, 0x0, 1"
        "${systemSettings.monitor2}, 1920x1080@144, 1920x0, 1"
				"${systemSettings.laptop-monitor}, 2256x1504@60, 0x0, 1.600000"
      ];

      # WORKSPACES
      # workspace = [
      #   "1,monitor:${systemSettings.monitor1}"
      #   "2,monitor:${systemSettings.monitor2}"
      # ];

      # Set programs that you use
      "$terminal" = "kitty";
      "$fileManager" = "dolphin";
      "$menu" = "fuzzel";

      general = {
        gaps_in = 4;
        gaps_out = 8;

        border_size = 2;

        layout = "dwindle";
      };

      # LOOKS
      "$opacity" = 0.9;
      decoration = {
        rounding = 0;
        inactive_opacity = "$opacity";
        blur = {
          enabled = true;
          size = 8;
        };
      };

      input = {
        sensitivity = -0.5;
        force_no_accel = true;
				touchpad.natural_scroll = true;
      };

      # KEYBINDINGS
      "$mainMod" = "SUPER"; # Sets "Windows" key as main modifier
      bind = [
        # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
        "$mainMod, K, killactive,"
        "$mainMod, V, togglefloating,"
        "$mainMod, P, pseudo,"
        "$mainMod, T, exec, $terminal"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, F, fullscreen"
        "$mainMod SHIFT, S, exec, bash ${userSettings.dotfilesDir}/homeModules/desktop/wm/hyprland/screenshot.sh"
        "ALT, space, exec, $menu"
        "$mainMod CTRL SHIFT, B, exec, bash ${userSettings.dotfilesDir}/homeModules/desktop/waybar/startup.sh"

        # Move focus with mainMod + arrow keys
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        # Move windows around
        "$mainMod CTRL, left, movewindow, l"
        "$mainMod CTRL, right, movewindow, r"
        "$mainMod CTRL, up, movewindow, u"
        "$mainMod CTRL, down, movewindow, d"

        # Resize windows
        "$mainMod SHIFT, left, resizeactive, -25 0"
        "$mainMod SHIFT, right, resizeactive, 25 0"
        "$mainMod SHIFT, up, resizeactive, 0 25"
        "$mainMod SHIFT, down, resizeactive, 0 -25"

        # Workspace navigation
        "$mainMod ALT, right, workspace, +2"
        "$mainMod ALT, left, workspace, -2"
				"$mainMod ALT SHIFT, up, movetoworkspacesilent, +2"
				"$mainMod ALT SHIFT, down, movetoworkspacesilent, -2"
      ];

      # Volume and brightness controls
      bindel = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
				", XF86MonBrightnessUp, exec, brightnessctl s +5%"
				", XF86MonBrightnessDown, exec, brightnessctl s 5%-"
      ];
      bindl = [
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ];

      # MOUSEBINDINGS
      bindm = [
        # Move/resize windows with mainMod + LMB/RMB and dragging
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };

	home.sessionVariables = {
		NIXOS_OZONE_WL = 1;
	};
}
