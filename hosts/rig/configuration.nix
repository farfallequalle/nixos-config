{
  config,
  pkgs,
  inputs,
  self,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    (import ../shared/configuration.nix {hostname = "rig";})
  ];

  home-manager.users.farfallequalle.imports = [
    ../../home/niri/rig.nix
  ];

  boot.kernelParams = [
    "video=DP-3:2560x1440"
  ];

  hardware.graphics.extraPackages = with pkgs; [
    intel-media-driver
  ];
}
