return {
    "mhartington/formatter.nvim",

    config = function()
        -- local default_formatters = require("formatter.defaults")
        -- local prettierd = default_formatters.prettierd

        require("formatter").setup({
            filetype = {
                -- javascript = { prettierd },
                -- typescript = { prettierd },
                -- javascriptreact = { prettierd },
                -- typescriptreact = { prettierd },

                ["*"] = {
                    require("formatter.filetypes.any").remove_trailing_whitespace
                },
            }
        })

        -- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        --     command = "FormatWrite"
        -- })
    end
}
