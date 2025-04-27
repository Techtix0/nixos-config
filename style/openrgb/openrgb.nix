{pkgs, ...}: {
  environment.systemPackages = [pkgs.openrgb];
  services.hardware.openrgb = {
    enable = true;
    package = pkgs.openrgb-with-all-plugins;
    motherboard = "amd";
  };

  systemd.services.openrgb-startup = {
    enable = true;
    description = "Loads profile for openrgb";
    wantedBy = ["multi-user.target"];
    after = ["network.target"];
    path = ["/run/current-system/sw"];
    script = ''
      openrgb -p profiles/nord.orp
      openrgb -c 463cbe -m static -b 100
    '';
  };
}
