{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    # home manager module for dooit
    inputs.dooit.homeManagerModules.default
  ];

  # adds dooit-extras to pkgs
  nixpkgs.overlays = [inputs.dooit-extras.overlay];

  programs.dooit = {
    enable = true;
    extraPackages = [pkgs.dooit-extras];
  };
}

