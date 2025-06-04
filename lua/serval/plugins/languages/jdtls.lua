return {
  'mfussenegger/nvim-jdtls',

  ft = { 'java' },

  config = function()
    local config = {
      cmd = {
        [[C:\Users\serggio\AppData\Local\nvim-data\mason\bin\jdtls.cmd]],
        '-configuration',
        [[C:\Users\serggio\.cache\jdtls\config]],
        '-data',
        [[C:\Users\serggio\.cache\jdtls\workspacejdtls]],
      },
      root_dir = require('jdtls.setup').find_root { 'gradle.build', 'pom.xml' },
    }

    vim.api.nvim_create_autocmd('BufEnter', {
      pattern = '*.java',
      callback = function()
        require('jdtls').start_or_attach(config)
      end,
    })
  end,
}
