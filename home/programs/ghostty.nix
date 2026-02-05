{pkgs, ...}:
{
  programs.ghostty = {
    enable = true;
    settings = {
      command = "${pkgs.zsh}/bin/zsh";
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
