{
  config,
  pkgs,
  ...
}: {
  programs.niri.settings = {
    layer-rules = [];
    
    window-rules = [
      {
        matches = [
          { app-id = "firefox"; }
        ];
        open-on-workspace = "browser";
      }

      {
        matches = [
          { app-id = "vesktop"; }
        ];
        open-on-workspace = "vesktop";
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
