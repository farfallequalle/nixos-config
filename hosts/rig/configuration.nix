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

  hardware.graphics.extraPackages = with pkgs; [
    intel-media-driver
  ];
}
