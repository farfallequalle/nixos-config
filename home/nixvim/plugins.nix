{ ... }:
{
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;
      settings.highlight.enable = true;
      settings.indent.enable = true;
    };

    telescope.enable = true;
    web-devicons.enable = true;

    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
        ];
        mapping.__raw = ''
          cmp.mapping.preset.insert({
            ['<C-n>'] = cmp.mapping.select_next_item(),
            ['<C-p>'] = cmp.mapping.select_prev_item(),
            ['<C-y>'] = cmp.mapping.confirm({ select = true }),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
          })
        '';
      };
    };

    lualine.enable = true;
    gitsigns.enable = true;
    oil.enable = true;
    comment.enable = true;
    sleuth.enable = true;
    indent-blankline.enable = true;
    trouble = {
      enable = true;
      settings.focus = true;
    };
    which-key = {
      enable = true;
      settings = {
        icons.separator = "  ";
        icons.group = "";
        spec = [
          { __unkeyed-1 = "<leader>f"; group = "Find..."; icon = { icon = " "; hl = "WhichKeyIconBlue"; }; }
          { __unkeyed-1 = "<leader>c"; group = "Code..."; icon = { icon = " "; hl = "WhichKeyIconOrange"; }; }
          { __unkeyed-1 = "<leader>r"; group = "Refactor..."; icon = { icon = "󰑕 "; hl = "WhichKeyIconGreen"; }; }
          { __unkeyed-1 = "<leader>x"; group = "Trouble..."; icon = { icon = " "; hl = "WhichKeyIconRed"; }; }
        ];
      };
    };
  };
}
