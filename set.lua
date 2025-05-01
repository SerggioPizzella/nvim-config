vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- disable netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.virtualedit = "block"

vim.opt.wrap = false

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.inccommand = "split"

vim.opt.scrolloff = 999
vim.opt.signcolumn = "yes"

-- Wait less to perform actions
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.colorcolumn = "80"
vim.opt.showmode = false

vim.opt.undofile = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.confirm = true
