return {
    'nvim-tree/nvim-tree.lua',

    dependencies = {
        { 'nvim-tree/nvim-web-devicons', lazy = false }
    },

    config = function()
        require('nvim-tree').setup()
        vim.keymap.set("n", "<leader>pv", require('nvim-tree.api').tree.focus, { desc = "[P]roject [V]iew" })
        vim.keymap.set("n", "<leader>pt", require('nvim-tree.api').tree.toggle, { desc = "[P]roject [T]oggle" })
    end
}
