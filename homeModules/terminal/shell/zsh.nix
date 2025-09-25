{userSettings, ...}: {
  # The option `users.defaultUserShell` in configuration.nix is required to set zsh as the default shell

  imports = [
    ./starship.nix
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;

    initContent = "tabs -2\n";

    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake " + userSettings.dotfilesDir;
      homeswitch = "home-manager switch --flake " + userSettings.dotfilesDir;
      nixdev = "nix develop --command $SHELL";
			c = "clear";
    };
  };
}
