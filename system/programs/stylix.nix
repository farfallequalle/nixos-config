{ pkgs, ... }:
{
  stylix = {
    enable = true;
    autoEnable = true;
    image = ../../wallpapers/greenknight.jpg;
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
        terminal = 11;
        desktop = 11;
      };
    };

  };
}
