{ ... }:
{
  imports = [
    ./plugins.nix
    ./lsp.nix
    ./keybinds.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    globals.mapleader = " ";

    highlightOverride = {
      WhichKeyGroup.link = "WhichKeyDesc";
      WhichKeyIconBlue = { fg = "#7daea3"; bold = true; };
      WhichKeyIconOrange = { fg = "#e78a4e"; bold = true; };
      WhichKeyIconGreen = { fg = "#a9b665"; bold = true; };
    };

    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      tabstop = 2;
      expandtab = true;
      smartindent = true;
      wrap = false;
      ignorecase = true;
      smartcase = true;
      termguicolors = true;
      signcolumn = "yes";
      clipboard = "unnamedplus";
      scrolloff = 8;
      updatetime = 250;
      undofile = true;
      cursorline = true;
      splitright = true;
      splitbelow = true;
    };

};
}
