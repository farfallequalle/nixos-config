{ lib, pkgs, ... }:

{
  programs.niri.settings.spawn-at-startup = [
    { command = ["vesktop"]; }
  ];
}
