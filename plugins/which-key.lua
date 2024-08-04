return {
    'folke/which-key.nvim',
    event = 'VimEnter',
    dependencies = { 'echasnovski/mini.nvim' },

    config = function()
        require('which-key').setup()
        require('mini.icons').setup()

        -- Document existing key chains
        require('which-key').add({
            { '<leader>c', group = '[C]ode' },
            { '<leader>d', group = '[D]ocument' },
            { '<leader>r', group = '[R]ename' },
            { '<leader>s', group = '[S]earch' },
            { '<leader>w', group = '[W]orkspace' },
            { '<leader>t', group = '[T]oggle' },
            { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
        })
    end
}
