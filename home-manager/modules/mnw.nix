{ pkgs, ... }: {
  programs.mnw = {
    enable = true;
    aliases = [ "vi" "vim" ];
    plugins = with pkgs.vimPlugins; [
      gruvbox-nvim
    ];
  };
}
