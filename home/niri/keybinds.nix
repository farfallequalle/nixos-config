{
  config,
  pkgs,
  ...
}: let
  apps = import ./applications.nix {inherit pkgs;};
in {
  programs.niri.settings.binds = with config.lib.niri.actions; let
    pactl = "${pkgs.pulseaudio}/bin/pactl";
    brightnessctl = "${pkgs.brightnessctl}/bin/brightnessctl";
    playerctl = "${pkgs.playerctl}/bin/playerctl";
    grim = "${pkgs.grim}/bin/grim";
    slurp = "${pkgs.slurp}/bin/slurp";
    wl-copy = "${pkgs.wl-clipboard}/bin/wl-copy";
    cliphist = "${pkgs.cliphist}/bin/cliphist";

    volume-up = spawn pactl ["set-sink-volume" "@DEFAULT_SINK@" "+5%"];
    volume-down = spawn pactl ["set-sink-volume" "@DEFAULT_SINK@" "-5%"];
    volume-mute = spawn pactl ["set-sink-mute" "@DEFAULT_SINK@" "toggle"];
    mic-mute = spawn pactl ["set-source-mute" "@DEFAULT_SOURCE@" "toggle"];

    brightness-up = spawn brightnessctl ["set" "10%+"];
    brightness-down = spawn brightnessctl ["set" "10%-"];

    media-play = spawn playerctl ["play-pause"];
    media-next = spawn playerctl ["next"];
    media-prev = spawn playerctl ["previous"];

    screenshot = spawn "sh" ["-c" "${grim} - | ${wl-copy}"];
    screenshot-select = spawn "sh" ["-c" "${grim} -g \"$(${slurp})\" - | ${wl-copy}"];
  in {
    "XF86AudioRaiseVolume".action = volume-up;
    "XF86AudioLowerVolume".action = volume-down;
    "XF86AudioMute".action = volume-mute;
    "XF86AudioMicMute".action = mic-mute;

    "XF86AudioPlay".action = media-play;
    "XF86AudioNext".action = media-next;
    "XF86AudioPrev".action = media-prev;

    "XF86MonBrightnessUp" = {
      allow-when-locked = true;
      action = brightness-up;
    };
    "XF86MonBrightnessDown" = {
      allow-when-locked = true;
      action = brightness-down;
    };

    "Print".action = screenshot;
    "Shift+Print".action = screenshot-select;
    "super+q".action = close-window;
    "super+b".action = spawn apps.browser;
    "super+Return".action = spawn apps.terminal;
    "super+E".action = spawn apps.terminal ["-e" "yazi"];
    "super+Space".action = spawn "noctalia-shell" ["ipc" "call" "launcher" "toggle"];

    "super+f".action = maximize-column;
    "super+shift+f".action = fullscreen-window;
    "super+t".action = toggle-window-floating;
    "super+Tab".action = toggle-overview;
    "super+comma".action = consume-or-expel-window-left;
    "super+period".action = consume-or-expel-window-right;
    "super+p".action = power-off-monitors;
    "super+alt+l".action = spawn "noctalia-shell" ["ipc" "call" "lockScreen" "lock"];
    "super+h".action = focus-column-left;
    "super+l".action = focus-column-right;
    "super+j".action = focus-window-down;
    "super+k".action = focus-window-up;
    "super+u".action = focus-workspace-down;
    "super+i".action = focus-workspace-up;

    "super+Left".action = focus-column-left;
    "super+Right".action = focus-column-right;
    "super+Down".action = focus-window-down;
    "super+Up".action = focus-window-up;
    "super+Page_Down".action = focus-workspace-down;
    "super+Page_Up".action = focus-workspace-up;

    "super+Shift+H".action = move-column-left;
    "super+Shift+L".action = move-column-right;
    "super+Shift+J".action = move-window-down;
    "super+Shift+K".action = move-window-up;
    "super+Shift+U".action = move-column-to-workspace-down;
    "super+Shift+I".action = move-column-to-workspace-up;

    "super+Shift+Left".action = move-column-left;
    "super+Shift+Right".action = move-column-right;
    "super+Shift+Down".action = move-window-down;
    "super+Shift+Up".action = move-window-up;
    "super+Shift+Page_Down".action = move-column-to-workspace-down;
    "super+Shift+Page_Up".action = move-column-to-workspace-up;

    "super+1".action = focus-workspace 1;
    "super+2".action = focus-workspace 2;
    "super+3".action = focus-workspace 3;
    "super+4".action = focus-workspace 4;
    "super+5".action = focus-workspace 5;
    "super+6".action = focus-workspace 6;
    "super+7".action = focus-workspace 7;
    "super+8".action = focus-workspace 8;
    "super+9".action = focus-workspace 9;

    "super+Shift+1".action = {move-column-to-workspace = 1;};
    "super+Shift+2".action = {move-column-to-workspace = 2;};
    "super+Shift+3".action = {move-column-to-workspace = 3;};
    "super+Shift+4".action = {move-column-to-workspace = 4;};
    "super+Shift+5".action = {move-column-to-workspace = 5;};
    "super+Shift+6".action = {move-column-to-workspace = 6;};
    "super+Shift+7".action = {move-column-to-workspace = 7;};
    "super+Shift+8".action = {move-column-to-workspace = 8;};
    "super+Shift+9".action = {move-column-to-workspace = 9;};

    "super+r".action = switch-preset-column-width;
  };
}
