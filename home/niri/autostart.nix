{ lib, pkgs, config, ... }:

let
  wallpaper = "${config.stylix.image}";
  swww = "${pkgs.swww}/bin/swww";
in
{
  programs.niri.settings.spawn-at-startup = [
    { command = [ swww "init" ]; }
    { command = [ "sh" "-c" "sleep 1 && ${swww} img ${wallpaper}" ]; }
    { command = [ "vesktop" ]; }
    { command = [ "Telegram" ]; }
    { command = [ "zapzap" ]; }
    { command = [ "firefox" ]; }
  ];
}
