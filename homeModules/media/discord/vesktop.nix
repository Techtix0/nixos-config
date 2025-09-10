{
  inputs,
  ...
}: {
  imports = [inputs.vesktop-nix.homeManagerModules.default];

  programs.vesktop = {
    enable = true;

    themes = {
    };

    vencordSettings = {
      themeLinks = [
        #"https://refact0r.github.io/system24/theme/system24.theme.css"
				"https://raw.githubusercontent.com/refact0r/midnight-discord/refs/heads/master/themes/flavors/midnight-catppuccin-mocha.theme.css"
      ];
      frameless = true;
    };
  };
}
