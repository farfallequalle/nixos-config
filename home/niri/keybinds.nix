{
  lib,
  config,
  pkgs,
  ...
}:

let
  apps = import ./applications.nix { inherit pkgs; };

in
{
  programs.niri.settings.binds =
    with config.lib.niri.actions;
    let
      pactl = "${pkgs.pulseaudio}/bin/pactl";
      brightnessctl = "${pkgs.brightnessctl}/bin/brightnessctl";

      volume-up = spawn pactl [
        "set-sink-volume"
        "@DEFAULT_SINK@"
        "+5%"
      ];
      volume-down = spawn pactl [
        "set-sink-volume"
        "@DEFAULT_SINK@"
        "-5%"
      ];

      brightness-up = spawn brightnessctl [
        "set"
        "10%+"
      ];
      brightness-down = spawn brightnessctl [
        "set"
        "10%-"
      ];
    in
    {

      "xf86audioraisevolume".action = volume-up;
      "xf86audiolowervolume".action = volume-down;

      "XF86MonBrightnessUp" = {
        allow-when-locked = true;
        action = brightness-up;
      };
      "XF86MonBrightnessDown" = {
        allow-when-locked = true;
        action = brightness-down;
      };

      "super+q".action = close-window;
      "super+b".action = spawn apps.browser;
      "super+Return".action = spawn apps.terminal;
      "super+E".action = spawn apps.fileManager;
      "super+Space".action = spawn apps.appLauncher "-show" "drun";

      "super+f".action = maximize-column;
      "super+shift+f".action = fullscreen-window;
      "super+t".action = toggle-window-floating;

      "super+Left".action = focus-column-left;
      "super+Right".action = focus-column-right;
      "super+Down".action = focus-workspace-down;
      "super+Up".action = focus-workspace-up;

      "super+Shift+Left".action = move-column-left;
      "super+Shift+Right".action = move-column-right;
      "super+Shift+Down".action = move-column-to-workspace-down;
      "super+Shift+Up".action = move-column-to-workspace-up;

      "super+Shift+H".action = move-column-left;
      "super+Shift+L".action = move-column-right;
      "super+Shift+J".action = move-column-to-workspace-down;
      "super+Shift+K".action = move-column-to-workspace-up;

      "super+1".action = focus-workspace "browser";
      "super+2".action = focus-workspace "chat";
      "super+3".action = focus-workspace "vesktop";

      "super+Shift+1".action = {
        move-column-to-workspace = "browser";
      };
      "super+Shift+2".action = {
        move-column-to-workspace = "chat";
      };
      "super+Shift+3".action = {
        move-column-to-workspace = "vesktop";
      };
    };
}
