return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
      'yavorski/lualine-macro-recording.nvim',
      'yavorski/lualine-lsp-progress.nvim',
  },
  config = function()
    local lualine = require("lualine")
    lualine.setup({
      options = {
        icons_enabled = true,
        theme = 'gruvbox',
      },
      sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { "filename", "filesize", "lsp_progress", "macro_recording", "%S" },
          lualine_x = { "selectioncount", "searchcount", "lsp_client_name", "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
      }
    })
  end
}
