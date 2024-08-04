return {
    -- Rose Pine Theme
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        priority = 1000,
        config = function()
            vim.cmd.colorscheme('rose-pine')
            vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
        end
    },

    -- Markdown Preview
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },

    -- Copilot
    'github/copilot.vim',
}
