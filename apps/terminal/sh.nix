{config, pkgs, userSettings, ...}:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake "+userSettings.dotfilesDir;
      homeswitch = "home-manager switch --flake "+userSettings.dotfilesDir;
      ll = "ls -al";
    };
  };
}