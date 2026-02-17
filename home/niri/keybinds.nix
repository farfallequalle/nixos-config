{
  config,
  pkgs,
  ...
}: let
  apps = import ./applications.nix {inherit pkgs;};
in {
  programs.niri.settings.binds = with config.lib.niri.actions; let
    pactl = "${pkgs.pulseaudio}/bin/pactl";
    playerctl = "${pkgs.playerctl}/bin/playerctl";
    grim = "${pkgs.grim}/bin/grim";
    slurp = "${pkgs.slurp}/bin/slurp";
    wl-copy = "${pkgs.wl-clipboard}/bin/wl-copy";

    volume-up = spawn pactl ["set-sink-volume" "@DEFAULT_SINK@" "+5%"];
    volume-down = spawn pactl ["set-sink-volume" "@DEFAULT_SINK@" "-5%"];
    volume-mute = spawn pactl ["set-sink-mute" "@DEFAULT_SINK@" "toggle"];
    mic-mute = spawn pactl ["set-source-mute" "@DEFAULT_SOURCE@" "toggle"];

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

    "Print".action = screenshot;
    "Print".hotkey-overlay.title = "Screenshot";
    "Shift+Print".action = screenshot-select;
    "Shift+Print".hotkey-overlay.hidden = true;
    "super+Shift+S".action = screenshot-select;
    "super+Shift+S".hotkey-overlay.title = "Screenshot (Auswahl)";

    "super+q".action = close-window;
    "super+b".action = spawn apps.browser;
    "super+b".hotkey-overlay.title = "Firefox";
    "super+Return".action = spawn apps.terminal;
    "super+Return".hotkey-overlay.title = "Terminal";
    "super+E".action = spawn apps.terminal ["-e" "yazi"];
    "super+E".hotkey-overlay.title = "Dateimanager (Yazi)";
    "super+Space".action = spawn "noctalia-shell" ["ipc" "call" "launcher" "toggle"];
    "super+Space".hotkey-overlay.title = "App Launcher";

    "super+f".action = maximize-column;
    "super+shift+f".action = fullscreen-window;
    "super+t".action = toggle-window-floating;
    "super+Tab".action = toggle-overview;
    "super+comma".action = consume-or-expel-window-left;
    "super+period".action = consume-or-expel-window-right;
    "super+p".action = power-off-monitors;
    "super+alt+l".action = spawn "noctalia-shell" ["ipc" "call" "lockScreen" "lock"];
    "super+alt+l".hotkey-overlay.title = "Bildschirm sperren";
    "super+x".action = spawn "noctalia-shell" ["ipc" "call" "sessionMenu" "toggle"];
    "super+x".hotkey-overlay.title = "Session-Menu";
    "super+h".action = focus-column-left;
    "super+l".action = focus-column-right;
    "super+j".action = focus-window-down;
    "super+k".action = focus-window-up;
    "super+u".action = focus-workspace-down;
    "super+i".action = focus-workspace-up;

    "super+Left".action = focus-column-left;
    "super+Left".hotkey-overlay.hidden = true;
    "super+Right".action = focus-column-right;
    "super+Right".hotkey-overlay.hidden = true;
    "super+Down".action = focus-window-down;
    "super+Down".hotkey-overlay.hidden = true;
    "super+Up".action = focus-window-up;
    "super+Up".hotkey-overlay.hidden = true;
    "super+Page_Down".action = focus-workspace-down;
    "super+Page_Down".hotkey-overlay.hidden = true;
    "super+Page_Up".action = focus-workspace-up;
    "super+Page_Up".hotkey-overlay.hidden = true;

    "super+Shift+H".action = move-column-left;
    "super+Shift+L".action = move-column-right;
    "super+Shift+J".action = move-window-down;
    "super+Shift+K".action = move-window-up;
    "super+Shift+U".action = move-column-to-workspace-down;
    "super+Shift+I".action = move-column-to-workspace-up;

    "super+Shift+Left".action = move-column-left;
    "super+Shift+Left".hotkey-overlay.hidden = true;
    "super+Shift+Right".action = move-column-right;
    "super+Shift+Right".hotkey-overlay.hidden = true;
    "super+Shift+Down".action = move-window-down;
    "super+Shift+Down".hotkey-overlay.hidden = true;
    "super+Shift+Up".action = move-window-up;
    "super+Shift+Up".hotkey-overlay.hidden = true;
    "super+Shift+Page_Down".action = move-column-to-workspace-down;
    "super+Shift+Page_Down".hotkey-overlay.hidden = true;
    "super+Shift+Page_Up".action = move-column-to-workspace-up;
    "super+Shift+Page_Up".hotkey-overlay.hidden = true;

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

    "super+Ctrl+H".action = focus-monitor-left;
    "super+Ctrl+L".action = focus-monitor-right;
    "super+Ctrl+Shift+H".action = move-column-to-monitor-left;
    "super+Ctrl+Shift+L".action = move-column-to-monitor-right;

    "super+F1".action = show-hotkey-overlay;
    "super+r".action = switch-preset-column-width;
  };
}
