{
  userSettings,
  ...
}: {
  programs.bash = {
    enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake " + userSettings.dotfilesDir;
      homeswitch = "home-manager switch --flake " + userSettings.dotfilesDir;
      ll = "ls -al";
      # screenshot = "grim -g \"$(slurp)\" /home/\"$(whoami)\"/Pictures/screenshots/\"$(date +%Y%m%d-%H%M%S)\".png";
    };
		#bashrcExtra = "PS1=''";
  };
}

