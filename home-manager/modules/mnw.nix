{ pkgs, ... }: {
  programs.mnw = {
    enable = true;
    aliases = [ "vi" "vim" ];
    initLua = builtins.readFile ../../lua/init.lua;
    plugins = [
      pkgs.vimPlugins.gruvbox-nvim
    ];
#      initLua = "vim.cmd('colorscheme gruvbox')";
  };
}
