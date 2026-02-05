{pkgs, ...}:
{
  programs.ghostty = {
    enable = true;
    settings = {
      command = "${pkgs.zsh}/bin/zsh";
      window-decoration = false;
      confirm-close-surface = false;
      font-family = "JetBrainsMono Nerd Font";
      font-size = 13;

      font-feature = [
        "-liga"
        "-dlig"
        "-calt"
      ];
    };
  };
}
