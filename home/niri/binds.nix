{ lib, config, pkgs, ... }:

{
  programs.niri.settings.binds = {
    "super+b".action = spawn firefox;
  };
}
