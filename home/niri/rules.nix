{
  config,
  pkgs,
  ...
}:
{
  programs.niri.settings = {
    layer-rules = [ ];

    window-rules = [
      {
        matches = [
          { app-id = "firefox"; }
        ];
        open-on-workspace = "browser";
        default-column-width.proportion = 1.0;
      }

      {
        matches = [
          { app-id = "org.telegram.desktop"; }
          { app-id = "zapzap"; }
        ];
        open-on-workspace = "chat";
        open-focused = false;
      }

      {
        matches = [
          { app-id = "vesktop"; }
        ];
        open-on-workspace = "vesktop";
        open-focused = false;
      }

      {
        matches = [ { } ];
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
