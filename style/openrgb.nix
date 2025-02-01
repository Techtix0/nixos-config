{pkgs, ...}:
{
	environment.systemPackages = [pkgs.openrgb];
	services.hardware.openrgb = {
		enable = true;
	};
}
