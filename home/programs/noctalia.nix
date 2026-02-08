{...}: {
  programs.noctalia-shell = {
    enable = true;
    settings = {
      bar = {
        position = "left";
        floating = false;
        showCapsule = true;
        widgets = {
          left = [
          {
            id = "ControlCenter";
            useDistroLogo = true;
          }
        ];
      };
      };
      colorSchemes = {
        darkMode = true;
        useWallpaperColors = true;
      };
    };
  };
}
