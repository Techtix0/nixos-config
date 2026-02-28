{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [];

  options = {};

  config = {
    environment.systemPackages = with pkgs; [
			pw3270 # 3270 emulator
			hercules # IBM mainframe emulator
		];
	networking.firewall.allowedTCPPorts = [ 3270 ];
	networking.firewall.allowedUDPPorts = [ 3270 ];
  };
}
