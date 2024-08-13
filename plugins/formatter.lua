return {
    'stevearc/conform.nvim',
    event = 'BufWritePre',
    cmd = 'ConformInfo',

    config = function()
        ---@module "conform"
        ---@type conform.setupOpts
        local config = {
            notify_on_error = false,
            default_format_opts = {
                async = true,
                lsp_format = "fallback",
            },
            formatters_by_ft = {
                javascript = { "prettierd", "prettier", stop_after_first = true },
                typescript = { "prettierd", "prettier", stop_after_first = true },
                typescriptreact = { "prettierd", "prettier", stop_after_first = true },
                ["_"] = { "trim_whitespace" },
            },
        }
        require('conform').setup(config)

        vim.keymap.set('n', '<leader>f', require('conform').format, { desc = '[F]ormat buffer' })
    end,
}
