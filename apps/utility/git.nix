{config, ...}: 
{
	programs.git = {
		enable = true;
		# userName = sops.git.username;
		# userEmail = sops.git.email;
	};
}
