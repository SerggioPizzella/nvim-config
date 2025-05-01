return {
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },

    on_attach = function(bufnr)
      local gitsigns = require 'gitsigns'
      vim.keymap.set('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = '[T]oggle git show [b]lame line' })
      vim.keymap.set('n', '<leader>tD', gitsigns.toggle_deleted, { desc = '[T]oggle git show [D]eleted' })
    end,
  },
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',

      -- Only one of these is needed.
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      local neogit = require 'neogit'
      neogit.setup {}

      vim.keymap.set('n', '<leader>gs', neogit.open, { desc = '[G]it [S]tatus' })
      vim.keymap.set('n', '<leader>gc', neogit.action('commit', 'commit'), { desc = '[G]it [C]ommit' })
      vim.keymap.set('n', '<leader>gP', neogit.action('push', 'push'), { desc = '[G]it [P]ush' })
    end,
  },
}
