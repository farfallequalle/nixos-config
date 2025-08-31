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

  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;

  system.stateVersion = "25.05";
}
