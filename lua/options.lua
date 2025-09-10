vim.cmd("let g:netrw_banner = 0")

vim.opt.guicursor = ""
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.incsearch = ture
vim.opt.inccommand = "split"

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8

vim.opt.backspace = {"start", "eol", "indent" }
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"

vim.opt.clipboard:append("unnamedplus")
vim.opt.hlsearch = true

vim.opt.mouse = "a"
vim.g.editorconfig = true
