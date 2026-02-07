{pkgs, ...}: {
  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
    settings = {
      workspaces = {
        "1-browser" = {name = "browser";};
        "2-notes" = {name = "notes";};
        "3-chat" = {name = "chat";};
        "4-discord" = {name = "discord";};
        "5" = {name = "5";};
      };

      prefer-no-csd = true;

      hotkey-overlay = {
        skip-at-startup = true;
      };

      layout = {
        always-center-single-column = true;

        background-color = "#00000000";
        default-column-width = {
          proportion = 0.5;
        };

        focus-ring = {
          enable = true;
          width = 3;
          active.color = "#7aa2f7";
          inactive.color = "#292e42";
        };

        gaps = 6;
      };

      input = {
        keyboard.xkb.layout = "de";
        touchpad = {
          click-method = "button-areas";
          dwt = true;
          dwtp = true;
          natural-scroll = true;
          scroll-method = "two-finger";
          tap = true;
          tap-button-map = "left-right-middle";
          middle-emulation = true;
          accel-profile = "adaptive";
        };
        focus-follows-mouse.enable = true;
        warp-mouse-to-focus.enable = false;
      };

      outputs = {
        #        "DP-1" = {
        #          mode = {
        #            width = 2560;
        #            height = 1440;
        #            refresh = 359.97900;
        #          };
        #          scale = 1.0;
        #          position = { x = 0; y = 0; };
        #        };
      };

      cursor = {
        size = 20;
        theme = "Adwaita";
      };

      environment = {
        CLUTTER_BACKEND = "wayland";
        GDK_BACKEND = "wayland,x11";
        MOZ_ENABLE_WAYLAND = "1";
        NIXOS_OZONE_WL = "1";
        QT_QPA_PLATFORM = "wayland";
        QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
        ELECTRON_OZONE_PLATFORM_HINT = "auto";

        XDG_SESSION_TYPE = "wayland";
        XDG_CURRENT_DESKTOP = "niri";
        DISPLAY = ":0";
      };
    };
  };
}
