{ ... }:
{
  programs.nixvim = {
    keymaps = [
      { mode = "n"; key = "<leader>ff"; action = "<cmd>Telescope find_files<cr>"; options.desc = "Find files"; }
      { mode = "n"; key = "<leader>fg"; action = "<cmd>Telescope live_grep<cr>"; options.desc = "Live grep"; }
      { mode = "n"; key = "<leader>fb"; action = "<cmd>Telescope buffers<cr>"; options.desc = "Buffers"; }
      { mode = "n"; key = "<leader>fh"; action = "<cmd>Telescope help_tags<cr>"; options.desc = "Help tags"; }
      { mode = "n"; key = "<leader>fd"; action = "<cmd>Telescope diagnostics<cr>"; options.desc = "Diagnostics"; }
      { mode = "n"; key = "<leader>fw"; action = "<cmd>Telescope grep_string<cr>"; options.desc = "Grep word"; }

      { mode = "n"; key = "gd"; action = "<cmd>lua vim.lsp.buf.definition()<cr>"; options.desc = "Go to definition"; }
      { mode = "n"; key = "gr"; action = "<cmd>lua vim.lsp.buf.references()<cr>"; options.desc = "References"; }
      { mode = "n"; key = "K"; action = "<cmd>lua vim.lsp.buf.hover()<cr>"; options.desc = "Hover"; }
      { mode = "n"; key = "<leader>ca"; action = "<cmd>lua vim.lsp.buf.code_action()<cr>"; options.desc = "Code action"; }
      { mode = "n"; key = "<leader>rn"; action = "<cmd>lua vim.lsp.buf.rename()<cr>"; options.desc = "Rename"; }

      { mode = "n"; key = "<C-h>"; action = "<C-w>h"; options.desc = "Window left"; }
      { mode = "n"; key = "<C-j>"; action = "<C-w>j"; options.desc = "Window down"; }
      { mode = "n"; key = "<C-k>"; action = "<C-w>k"; options.desc = "Window up"; }
      { mode = "n"; key = "<C-l>"; action = "<C-w>l"; options.desc = "Window right"; }

      { mode = "n"; key = "<leader>d"; action = "<cmd>lua vim.diagnostic.open_float()<cr>"; options.desc = "Line diagnostics"; }
      { mode = "n"; key = "<leader>e"; action = "<cmd>Oil<cr>"; options = { desc = "Open file explorer"; silent = true; }; }

      { mode = "n"; key = "<Esc>"; action = "<cmd>nohlsearch<cr>"; options.desc = "Clear search"; }
    ];
  };
}
