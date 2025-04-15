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
      reload_workspace_from_cargo_toml = true,
      server = {
        on_attach = function(_, bufnr)
        end
      },
      dap = {
        adapter = {
          type = "executable",
          command = "lldb-dap",
          name = "lldb"
        }
      },
    })
  end
}

