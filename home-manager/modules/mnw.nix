{ pkgs, ... }:
{
  programs.mnw = {
    enable = true;
    aliases = [
      "vi"
      "vim"
    ];
    luaFiles = [
    		../../lua/init.lua
    		../../lua/options.lua
    		../../lua/keymaps.lua
		];
    plugins = {
      start = with pkgs.vimPlugins; [ gruvbox-nvim
        bufferline-nvim ];
      opt = [ ];
      dev = { };
    };
  };
}
