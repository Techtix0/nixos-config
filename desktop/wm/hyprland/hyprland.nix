{
  pkgs,
  lib,
  inputs,
  systemSettings,
  ...
}: {
  imports = [
    # ./hyprpaper.nix
    # ./hyprlock.nix
    ./wl-clipboard.nix
  ];

  # Temporary fix
  #	stylix.targets.hyprland.enable = false;

  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      # Waybar startup/refresh script
      exec-once = "~/.dotfiles/desktop/waybar/startup.sh";

      # See https://wiki.hyprland.org/Configuring/Monitors/
      monitor = [
        "${systemSettings.monitor1}, 1920x1080@144, 0x0, 1"
        "${systemSettings.monitor2}, 1920x1080@144, 1920x0, 1"
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
        gaps_in = 5;
        gaps_out = 10;

        border_size = 2;

        layout = "dwindle";
      };

      # LOOKS
      "$opacity" = 0.9;
      decoration = {
        rounding = 8;
        # active_opacity = "$opacity";
        inactive_opacity = "$opacity";
        # fullscreen_opacity = "$opacity";
        blur = {
          enabled = true;
          size = 8;
        };
      };

      input = {
        sensitivity = -0.5;
        force_no_accel = true;
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
        "$mainMod SHIFT, S, exec, bash ~/.dotfiles/desktop/wm/hyprland/screenshot.sh"
        "ALT, space, exec, $menu"
        "$mainMod CTRL SHIFT, B, exec, bash ~/.dotfiles/desktop/waybar/startup.sh"

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
      ];

      # Volume controls
      bindel = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
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
}
