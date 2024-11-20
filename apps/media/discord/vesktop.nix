{
  inputs,
  pkgs,
  config,
  ...
}: {
  imports = [inputs.vesktop-nix.homeManagerModules.default];

  programs.vesktop = {
    enable = true;

    themes = {
    };

    vencordSettings = {
      themeLinks = ["https://refact0r.github.io/system24/theme/system24.theme.css"];
      frameless = true;
    };
  };
}
