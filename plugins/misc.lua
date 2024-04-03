return {
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        opts = {
            disable_background = true
        }
    },

    -- Plugin to show you pending keybinds.
    { 'folke/which-key.nvim', opts = {} },

    -- Set lualine as statusline

     -- Autocompletion
    {
         'hrsh7th/nvim-cmp',
         dependencies = {
             -- Snippet Engine & its associated nvim-cmp source
             'L3MON4D3/LuaSnip',
             'saadparwaiz1/cmp_luasnip',

             -- Adds LSP completion capabilities
             'hrsh7th/cmp-nvim-lsp',

             -- Adds a number of user-friendly snippets
             'rafamadriz/friendly-snippets',
         },
     },

    -- Markdown Preview
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },

    -- Copilot
    'github/copilot.vim'
}
