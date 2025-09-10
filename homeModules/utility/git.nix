{config, ...}: {
  config = {
    programs.git = {
      enable = true;
      userName = ''${config.sops.secrets.git_username.path}'';
      userEmail = ''${config.sops.secrets.git_email.path}'';
    };
    sops.secrets.git_username = {};
    sops.secrets.git_email = {};
  };
}
