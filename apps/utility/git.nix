{config, ...}: 
{
	programs.git = {
		enable = true;
		userName = config.sops.git.username;
		userEmail = config.sops.git.email;
	};
}
