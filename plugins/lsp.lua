-- LSP Configuration & Plugins
return {
  'neovim/nvim-lspconfig',

  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',

    -- Useful status updates for LSP
    { 'j-hui/fidget.nvim', opts = {} },

    -- Additional lua configuration, makes nvim stuff amazing!
    {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
    'nvim-telescope/telescope.nvim',
  },

  config = function()
    --  This function gets run when an LSP connects to a particular buffer.
    local on_attach = function(_, bufnr)
      -- In this case, we create a function that lets us more easily define mappings specific
      -- for LSP related items. It sets the mode, buffer and description for us each time.
      local nmap = function(keys, func, desc)
        if desc then
          desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
      end

      nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
      nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

      nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
      nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
      nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
      nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
      nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
      nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

      -- See `:help K` for why this keymap
      nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
      nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

      -- Lesser used LSP functionality
      nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
      nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
      nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
      nmap('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, '[W]orkspace [L]ist Folders')
    end

    local servers = {
      jdtls = {},
      lua_ls = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
      intelephense = {
        telemetry = {
          enabled = false
        }
      },
      html = {},
      cssls = {},
      tailwindcss = {},
      powershell_es = {},
      tsserver = {},
      biome = {},
      -- prettierd = {},
      pico8_ls = {
        filetypes = { 'pico8' },
      },
    }

    -- Setup mason before mason-lspconfig
    require('mason').setup()
    local mason_lspconfig = require('mason-lspconfig')
    mason_lspconfig.setup({
      ensure_installed = vim.tbl_keys(servers),
    })

    -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)

    mason_lspconfig.setup_handlers({
      function(server_name)
        require('lspconfig')[server_name].setup {
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server_name],
          filetypes = (servers[server_name] or {}).filetypes,
        }
      end,

      -- Disable tsserver from starting up here, it is handled by ts-tools.
      ["tsserver"] = function()
        vim.api.nvim_create_autocmd("LspAttach", {
          callback = function(args)
            on_attach({}, args.bufnr)
          end,
        })
      end,
      -- Disable jdtls from starting up here, it is handled by nvim-jdtls.
      ["jdtls"] = function()
        vim.api.nvim_create_autocmd("LspAttach", {
          callback = function(args)
            on_attach({}, args.bufnr)
          end,
        })
      end,
    })
  end,
}
