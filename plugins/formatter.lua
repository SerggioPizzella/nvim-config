return {
    'stevearc/conform.nvim',
    event = 'BufWritePre',
    cmd = 'ConformInfo',

    config = function()
        ---@module "conform"
        ---@type conform.setupOpts
        local config = {
            notify_on_error = false,
            formatters_by_ft = {
                javascript = { "prettierd", "prettier", stop_after_first = true },
                typescript = { "prettierd", "prettier", stop_after_first = true },
                typescriptreact = { "prettierd", "prettier", stop_after_first = true },
            }
        }
        require('conform').setup(config)

        vim.keymap.set('n', '<leader>f', function()
            require('conform').format({ async = true, lsp_format = "fallback" })
        end, { desc = '[F]ormat buffer' })
    end,
}
