{...}: {
  programs.niri.settings = {
    layer-rules = [];

    window-rules = [
      {
        matches = [
          {app-id = "firefox";}
        ];
        open-on-workspace = "main";
        open-maximized = true;
      }


      {
        matches = [
          {app-id = "vesktop";}
        ];
        open-on-workspace = "vesktop";
        open-focused = false;
        open-maximized = true;
      }

      {
        matches = [
          {app-id = "org.telegram.desktop";}
          {app-id = "whatsapp-electron";}
        ];
        open-on-workspace = "chat";
        open-focused = false;
      }

      {
        matches = [
          {app-id = "obsidian";}
        ];
        open-on-workspace = "notes";
        open-maximized = true;
      }

      # Steam windows: prevent floating by default
      {
        matches = [
          {app-id = "^steam$";}
        ];
        open-floating = false;
        open-focused = false;
      }

      # Steam notification toasts (overrides above)
      {
        matches = [
          {
            app-id = "^steam$";
            title = "^notificationtoasts_";
          }
        ];
        open-focused = false;
        open-floating = true;
        default-floating-position = {
          x = 10;
          y = 10;
          relative-to = "bottom-right";
        };
      }

      # Steam games
      {
        matches = [
          {app-id = "^steam_app_";}
        ];
        open-on-workspace = "main";
        open-maximized = true;
      }

      # Global corner radius
      {
        matches = [{}];
        geometry-corner-radius = {
          top-left = 20.0;
          top-right = 20.0;
          bottom-left = 20.0;
          bottom-right = 20.0;
        };
        clip-to-geometry = true;
      }
    ];
  };
}
