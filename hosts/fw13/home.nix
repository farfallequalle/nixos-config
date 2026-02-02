{ config, pkgs, inputs, self, ... }:

let
    allPackages = import ./packages.nix { inherit pkgs; };
in
{
  home.username = "farfallequalle";
  home.homeDirectory = "/home/farfallequalle";

  imports = [
    ../../home/niri/default.nix
    ../../home/programs/firefox.nix
    ../../home/programs/ghostty.nix
    ../../system/programs/stylix.nix
  ];

  home.packages = allPackages;

  xdg.portal.enable = true;
  # goated:
  programs.nh.enable = true;

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Begrüßung deaktivieren
    '';
    shellAliases = {
      nrs = "git -C ~/nixos-config add . && nh os switch ~/nixos-config -H fw13";
      host = "nvim ~/nixos-config/hosts/fw13";
      home = "nvim ~/nixos-config/home";
      flake = "nvim ~/nixos-config/flake.nix";
    };
  };

  home.stateVersion = "25.11";
  programs.home-manager.enable = true;

}
