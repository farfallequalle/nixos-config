{...}: {
  programs.noctalia-shell = {
    enable = true;
    settings = {
      bar = {
        position = "top";
        floating = false;
        showCapsule = true;
        widgets = {
          left = [
            {
              id = "ControlCenter";
              useDistroLogo = true;
            }
            {
              formatHorizontal = "HH";
              formatVertical = "HH";
              id = "Clock";
              useMonospacedFont = true;
              usePrimaryColor = true;
            }
          ];
          center = [
            {
              hideUnoccupied = true;
              id = "Workspace";
              labelMode = "none";
            }
          ];
          right = [];
        };
      };
      colorSchemes = {
        darkMode = true;
        useWallpaperColors = true;
      };
    };
  };
}
