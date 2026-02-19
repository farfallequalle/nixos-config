{ pkgs }:

{
  browser = "${pkgs.firefox}/bin/firefox";
  terminal = "${pkgs.ghostty}/bin/ghostty";
  pactl = "${pkgs.pulseaudio}/bin/pactl";
  playerctl = "${pkgs.playerctl}/bin/playerctl";
  grim = "${pkgs.grim}/bin/grim";
  slurp = "${pkgs.slurp}/bin/slurp";
  wl-copy = "${pkgs.wl-clipboard}/bin/wl-copy";
}
