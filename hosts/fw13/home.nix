{ config, pkgs, inputs, self, ... }:

{
  home.username = "farfallequalle";
  home.homeDirectory = "/home/farfallequalle";

  imports = [
    ../../home/niri/default.nix
  ];

  xdg.portal.enable = true;

  home.stateVersion = "25.11";
  programs.home-manager.enable = true;

}
