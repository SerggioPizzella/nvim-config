return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  lazy = false, -- neo-tree will lazily load itself
  config = function()
    ---@module "neo-tree"
    ---@type neotree.Config?
    require('neo-tree').setup({})

    vim.keymap.set('n', '<leader>pv', ':Neotree<CR>', { desc = '[P]roject [V]iew' })
    vim.keymap.set('n', '<leader>pt', ':Neotree toggle<CR>', { desc = '[P]roject [T]oggle' })
  end,
}
