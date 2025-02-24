{config, ...}: 
{
	programs.git = {
		enable = true;
		userName = ''$(cat ${config.sops.secrets.git_username.path})'';
		userEmail = ''$(cat ${config.sops.secrets.git_email.path})'';
	};
}
