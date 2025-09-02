{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./nixos/modules
  ];

  networking.hostName = "fw13";
  system.stateVersion = "25.05";
}
