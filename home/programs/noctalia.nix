{...}: {
  programs.noctalia-shell = {
    enable = true;
    settings = {
      bar = {
        position = "top";
        floating = false;
      };
      colorSchemes = {
        darkMode = true;
        useWallpaperColors = true;
      };
    };
  };
}
