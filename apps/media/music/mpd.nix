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
    home.packages = with pkgs; [ mpd ];

		services.mpd = {
			enable = true;
			musicDirectory = "/home/${userSettings.username}/Music";
			network.startWhenNeeded = true;
			extraConfig = ''
				audio_output {
					type "pipewire"
					name "PipeWire output"
				}
			'';
		};
	};
}
