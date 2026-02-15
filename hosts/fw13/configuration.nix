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
    (import ../shared/configuration.nix { hostname = "fw13"; })
    "${self}/system/programs/power.nix"
  ];

  services.fwupd.enable = true;
  services.upower.enable = true;
  hardware.sensor.iio.enable = true;
  boot.kernelParams = [ "amdgpu.sg_display=0" ];
  hardware.amdgpu.initrd.enable = true;
}
