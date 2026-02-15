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
    (import ../shared/configuration.nix { hostname = "rig"; })
  ];
}
