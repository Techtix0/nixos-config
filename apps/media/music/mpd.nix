{
  config,
  pkgs,
  lib,
	userSettings,
  ...
}: {
  imports = [];

  options = {};

  config = {
		services.mpd = {
			enable = true;
			user = userSettings.username;
			musicDirectory = "/home/${userSettings.username}/Music";
			extraConfig = ''
				audio_output {
					type "pipewire"
					name "PipeWire output"
				}
			'';
		};

		systemd.services.mpd.environment = {
			XDG_RUNTIME_DIR = "/run/user/${toString config.users.users.${userSettings.username}.uid}";
		};
	};
}
