{userSettings, ...}: {
  # The option `users.defaultUserShell` in configuration.nix is required to set zsh as the default shell

	imports = [
		./starship.nix
	];

  programs.zsh = {
    enable = true;
    enableCompletion = true;

		initExtra = "tabs -2";

    shellAliases = {
      ll = "ls -l";
      rebuild = "sudo nixos-rebuild switch --flake " + userSettings.dotfilesDir;
      homeswitch = "home-manager switch --flake " + userSettings.dotfilesDir;
			nixdev = "nix develop --command $SHELL";
    };

		# plugin manager
    # oh-my-zsh = {
    #   enable = true;
    #   plugins = [];
    # };
  };
}
