vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- disable netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.inccommand = "split"

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.showmode = false
vim.opt.updatetime = 50
vim.opt.timeoutlen = 300

vim.opt.colorcolumn = "+80"
