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
			network = {
				startWhenNeeded = true;
				listenAddress = "127.0.0.1";
			};
			extraConfig = ''
				audio_output {
					type "pipewire"
					name "PipeWire output"
				}
			'';
		};
	};
}
