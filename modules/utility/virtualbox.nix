{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [];

  options = {};

  config = {
    programs.virtualbox.enable = true;
  };
}
