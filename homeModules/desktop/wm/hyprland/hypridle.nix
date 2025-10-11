{config, pkgs, lib, ...}:
{
    imports = [];

    options = {};

    config = {
			services.hypridle = {
				enable = true;
				settings = {
					general = {
						lock_cmd = "pidof hyprlock || hyprlock";
						before_sleep_cmd = "loginctl lock-session"; # lock before suspend
						after_sleep_cmd = "hyprctl dispatch dpms on";
					};

					listener = [
						# Lock the screen
						{
						  timeout = 300;
						  on-timeout = "loginctl lock-session";
						}
						
						# Turn off screen
						{
						  timeout = 420;
						  on-timeout = "hyprctl dispatch dpms off";
						  on-resume = "hyprctl dispatch dpms on";
						}
						
						# Suspend the system
						{
							timeout = 600;
							on-timeout = "systemctl suspend";
						}
					];
				};
			};
		};
}
