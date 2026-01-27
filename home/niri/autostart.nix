{ lib, pkgs, ... }:

{
  programs.niri.settings.spawn-at-startup = [
    { command = [ "vesktop" ]; }
    { command = [ "Telegram" ]; }
    { command = [ "zapzap" ]; }
    { command = [ "sh" "-c" "sleep 3 && firefox" ]; }
  ];
}
