{pkgs, ...}: {
  environment.systemPackages = [pkgs.openrgb];
  services.hardware.openrgb = {
    enable = true;
    package = pkgs.openrgb-with-all-plugins;
    motherboard = "amd";
  };
}
