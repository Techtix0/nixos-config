{pkgs, ...}:
{
	environment.systemPackages = [
		pkgs.vintagestory  
	];

	networking.firewall.allowedTCPPorts = [ 42420 ];
}
