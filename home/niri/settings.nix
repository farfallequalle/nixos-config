{pkgs, ...}: {
  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
    settings = {
      workspaces = {
        "1-main" = {name = "main";};
        "2-notes" = {name = "notes";};
        "3-vesktop" = {name = "vesktop";};
        "4-chat" = {name = "chat";};
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
        focus-follows-mouse.enable = true;
        warp-mouse-to-focus.enable = false;
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
