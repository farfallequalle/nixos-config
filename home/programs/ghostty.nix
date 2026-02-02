{ pkgs, config, ... }:
{
  programs.ghostty = {
    enable = true;
    settings = {
      font-size = 11;
      font-family = "JetBrainsMono Nerd Font";

      window-decoration = false;
      confirm-close-surface = false;

      # Disables ligatures
      font-feature = [
        "-liga"
        "-dlig"
        "-calt"
      ];
    };
  };
}
