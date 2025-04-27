{pkgs, ...}: {
  environment.systemPackages = [pkgs.openrgb];
  services.hardware.openrgb = {
    enable = true;
    package = pkgs.openrgb-with-all-plugins;
    motherboard = "amd";
  };

  systemd.user.services.openrgb-startup = {
    enable = true;
    after = ["network.target"];
    description = "Loads profile for openrgb";
    serviceConfig = {
      Type = "simple";
      ExecStart = ''./startup.sh'';
    };
  };
}
