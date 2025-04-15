return {
 'simrat39/rust-tools.nvim',
  dependencies = {
    'neovim/nvim-lspconfig',
    'nvim-lua/plenary.nvim',
    'mfussenegger/nvim-dap'
  },
  config = function ()
    local rt = require("rust-tools")
    rt.setup({
      server = {
        on_attach = function(_, bufnr)
        end
      },
      dap = {},
    })
  end
}

