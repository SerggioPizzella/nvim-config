-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('serval-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('BufEnter', {
  desc = 'Settings for lua files',
  group = vim.api.nvim_create_augroup('serval-settings-lua', { clear = true }),
  pattern = '*.lua',
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>")
    vim.keymap.set("n", "<leader>x", ":.lua<CR>")
    vim.keymap.set("v", "<leader>x", ":lua<CR>")
  end,

})
