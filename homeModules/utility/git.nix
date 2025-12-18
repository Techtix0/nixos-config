{config, ...}: {
  config = {
    programs.git = {
      enable = true;
			settings = {
				user = {
					email = ''${config.sops.secrets.git_email.path}'';
      		name = ''${config.sops.secrets.git_username.path}'';
				};
			};    
		};
    sops.secrets.git_username = {};
    sops.secrets.git_email = {};
  };
}
