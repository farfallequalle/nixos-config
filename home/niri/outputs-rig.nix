{...}: {
  programs.niri.settings.outputs = {
    "HDMI-A-1" = {
      mode = {
        width = 1920;
        height = 1080;
        refresh = 60.0;
      };
      scale = 1.0;
      transform.rotation = 90;
      position = {
        x = 0;
        y = 0;
      };
    };
    "DP-3" = {
      mode = {
        width = 2560;
        height = 1440;
        refresh = 180.0;
      };
      scale = 1.0;
      variable-refresh-rate = true;
      position = {
        x = 1080;
        y = 0;
      };
    };
  };
}
