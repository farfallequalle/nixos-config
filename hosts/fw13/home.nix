{ config, pkgs, inputs, self, ... }:

let
    allPackages = import ./packages.nix { inherit pkgs; };
in
{
  home.username = "farfallequalle";
  home.homeDirectory = "/home/farfallequalle";

  imports = [
    ../../home/niri/default.nix
  ];

  home.packages = allPackages;

  xdg.portal.enable = true;

  home.stateVersion = "25.11";
  programs.home-manager.enable = true;

}
