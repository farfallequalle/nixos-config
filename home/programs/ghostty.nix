{pkgs, ...}:
{
  programs.ghostty = {
    enable = true;
    settings = {
      command = "${pkgs.zsh}/bin/zsh";
      theme = "noctalia";
      window-decoration = false;
      confirm-close-surface = false;
      font-feature = [
        "-liga"
        "-dlig"
        "-calt"
      ];
    };
  };
}
