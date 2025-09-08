{ pkgs, ... }:
{
  programs.mnw = {
    enable = true;
    aliases = [
      "vi"
      "vim"
    ];
    initLua = builtins.readFile ../../lua/init.lua;
    plugins = {
      start = [ pkgs.vimPlugins.gruvbox-nvim ];
      opt = [ ];
      dev = { };
    };
  };
}
