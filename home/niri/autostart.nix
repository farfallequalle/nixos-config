{ lib, pkgs, ... }:

{
  programs.niri.settings.spawn-at-startup = [
    { command = [ "vesktop" ]; }
    { command = [ "Telegram" ]; }
    { command = [ "zapzap" ]; }
    { command = [ "firefox" ]; }
  ];
}
