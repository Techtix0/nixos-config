{
  config,
  pkgs,
  lib,
  userSettings,
  ...
}: {
  imports = [];

  options = {};

  config = {
    virtualisation.virtualbox.host.enable = true;
    users.extraGroups.vboxusers.members = ["${userSettings.username}"];

    boot.kernelParams = ["kvm.enable_virt_at_load=0"];
  };
}
