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
		# mpd client
		environment.systemPackages = with pkgs; [
			rmpc
		];

		# mpd config
		services.mpd = {
			enable = true;
			musicDirectory = "/home/${userSettings.username}/Music";
			extraConfig = ''
				audio_output {
					type "pipewire"
					name "PipeWire output"
				}
			'';
		};
	};
}
