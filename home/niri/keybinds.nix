{
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
      playerctl = "${pkgs.playerctl}/bin/playerctl";
      grim = "${pkgs.grim}/bin/grim";
      slurp = "${pkgs.slurp}/bin/slurp";
      wl-copy = "${pkgs.wl-clipboard}/bin/wl-copy";
      cliphist = "${pkgs.cliphist}/bin/cliphist";
      rofi = "${pkgs.rofi}/bin/rofi";

      volume-up = spawn pactl [ "set-sink-volume" "@DEFAULT_SINK@" "+5%" ];
      volume-down = spawn pactl [ "set-sink-volume" "@DEFAULT_SINK@" "-5%" ];
      volume-mute = spawn pactl [ "set-sink-mute" "@DEFAULT_SINK@" "toggle" ];
      mic-mute = spawn pactl [ "set-source-mute" "@DEFAULT_SOURCE@" "toggle" ];

      brightness-up = spawn brightnessctl [ "set" "10%+" ];
      brightness-down = spawn brightnessctl [ "set" "10%-" ];

      media-play = spawn playerctl [ "play-pause" ];
      media-next = spawn playerctl [ "next" ];
      media-prev = spawn playerctl [ "previous" ];

      screenshot = spawn "sh" [ "-c" "${grim} - | ${wl-copy}" ];
      screenshot-select = spawn "sh" [ "-c" "${grim} -g \"$(${slurp})\" - | ${wl-copy}" ];
      clipboard-history = spawn "sh" [ "-c" "${cliphist} list | ${rofi} -dmenu | ${cliphist} decode | ${wl-copy}" ];
    in
    {

      "XF86AudioRaiseVolume".action = volume-up;
      "XF86AudioLowerVolume".action = volume-down;
      "XF86AudioMute".action = volume-mute;
      "XF86AudioMicMute".action = mic-mute;

      "XF86AudioPlay".action = media-play;
      "XF86AudioNext".action = media-next;
      "XF86AudioPrev".action = media-prev;

      "XF86MonBrightnessUp" = { allow-when-locked = true; action = brightness-up; };
      "XF86MonBrightnessDown" = { allow-when-locked = true; action = brightness-down; };

      "Print".action = screenshot;
      "Shift+Print".action = screenshot-select;
      "super+v".action = clipboard-history;

      "super+q".action = close-window;
      "super+b".action = spawn apps.browser;
      "super+Return".action = spawn apps.terminal;
      "super+E".action = spawn apps.fileManager;
      "super+Space".action = spawn apps.appLauncher "-show" "drun";

      "super+f".action = maximize-column;
      "super+shift+f".action = fullscreen-window;
      "super+t".action = toggle-window-floating;
      "super+Tab".action = toggle-overview;
      "super+comma".action = consume-or-expel-window-left;
      "super+period".action = consume-or-expel-window-right;

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
