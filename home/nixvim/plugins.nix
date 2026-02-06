{ ... }:
{
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;
      settings.highlight.enable = true;
      settings.indent.enable = true;
    };

    telescope = {
      enable = true;
      defaults.initial_mode = "normal";
      extensions.file-browser = {
        enable = true;
        settings = {
          hijack_netrw = true;
          initial_mode = "normal";
          display_stat.__raw = "false";
          layout_config.__raw = "{ preview_width = 0.7 }";
        };
      };
    };
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

    lualine = {
      enable = true;
      settings.sections.lualine_x = [ "filetype" ];
    };
    gitsigns.enable = true;

    comment.enable = true;
    sleuth.enable = true;
    indent-blankline.enable = true;
    obsidian = {
      enable = true;
      settings = {
        workspaces = [{
          name = "vault";
          path = "~/Seafile/VAULT-42";
        }];
        completion = {
          nvim_cmp = true;
          min_chars = 2;
        };
        legacy_commands = false;
      };
    };
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
          { __unkeyed-1 = "<leader>o"; group = "Obsidian..."; icon = { icon = "󱓧 "; hl = "WhichKeyIconBlue"; }; }
          { __unkeyed-1 = "<leader>x"; group = "Trouble..."; icon = { icon = " "; hl = "WhichKeyIconRed"; }; }
        ];
      };
    };
  };
}
