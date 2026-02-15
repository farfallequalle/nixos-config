{
  # config,
  # pkgs,
  ...
}: {
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

      {
        matches = [
          {app-id = "vesktop";}
        ];
        open-on-workspace = "vesktop";
        open-focused = false;
        open-maximized = true;
      }

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
