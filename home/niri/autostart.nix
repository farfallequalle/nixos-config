{ lib, pkgs, config, ... }:

let
  wallpaper = "${config.stylix.image}";
  swww = "${pkgs.swww}/bin/swww";
  wl-paste = "${pkgs.wl-clipboard}/bin/wl-paste";
  cliphist = "${pkgs.cliphist}/bin/cliphist";
in
{
  programs.niri.settings.spawn-at-startup = [
    { command = [ "${pkgs.swww}/bin/swww-daemon" ]; }
    { command = [ "sh" "-c" "sleep 2 && ${swww} img ${wallpaper}" ]; }
    { command = [ "sh" "-c" "${wl-paste} --watch ${cliphist} store" ]; }
    { command = [ "vesktop" ]; }
    { command = [ "Telegram" ]; }
    { command = [ "zapzap" ]; }
    { command = [ "sh" "-c" "sleep 2 && firefox" ]; }
  ];
}
