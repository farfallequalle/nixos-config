{pkgs, ...}: {
  stylix = {
    enable = true;
    autoEnable = true;
    image = ../../wallpapers/greenwanderer.jpg;
    polarity = "dark";

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };
      sansSerif = {
        package = pkgs.inter;
        name = "Inter";
      };
      serif = {
        package = pkgs.noto-fonts;
        name = "Noto Serif";
      };
      sizes = {
        terminal = 13;
        desktop = 11;
      };
    };
  };

  stylix.targets = {
    vesktop.enable = true;
    bat.enable = true;
    ghostty.enable = true;
    fzf.enable = true;
    rofi.enable = true;
    nixvim = {
      enable = true;
      colors.enable = false;
      fonts.enable = true;
    };
  };
}
