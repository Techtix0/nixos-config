{
  pkgs,
  ...
}:let
  #vesktop = pkgs.vesktop.overrideAttrs { electron = pkgs.electron_39; };
in  {
	imports = [];

	options = {};

	config = {
		#nixpkgs.config.permittedInsecurePackages = [
		#	"electron-37.10.3"
		#];
	
		environment.systemPackages = [
			pkgs.vesktop
  	];

	};
}
