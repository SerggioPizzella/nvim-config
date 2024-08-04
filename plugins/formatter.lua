return {
    'stevearc/conform.nvim',
    event = 'BufWritePre',
    cmd = 'ConformInfo',

    config = function()
        require('conform').setup({
            notify_on_error = false,
        })

        vim.keymap.set('n', '<leader>f', function()
            require('conform').format({ async = true, lsp_format = "fallback" })
        end, { desc = '[F]ormat buffer' })
    end,
}
