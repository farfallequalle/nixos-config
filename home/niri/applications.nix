{ pkgs }:

{
  browser = "${pkgs.firefox}/bin/firefox";
  terminal = "${pkgs.ghostty}/bin/ghostty";
  fileManager = "${pkgs.thunar}/bin/thunar";
  vesktop = "${pkgs.vesktop}/bin/vesktop";
  appLauncher = "${pkgs.rofi}/bin/rofi";
}
