{ pkgs }:

{
  browser = "${pkgs.firefox}/bin/firefox";
  terminal = "${pkgs.ghostty}/bin/ghostty";
  fileManager = "${pkgs.thunar}/bin/thunar";
  appLauncher = "${pkgs.walker}/bin/walker";
}
