{userSettings, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      rebuild = "sudo nixos-rebuild switch --flake " + userSettings.dotfilesDir;
      homeswitch = "home-manager switch --flake " + userSettings.dotfilesDir;
    };
		histSize = 1000;

		oh-my-zsh = {
			enable = true;
			plugins = ["git" "thefuck"];
		};
  };
}
