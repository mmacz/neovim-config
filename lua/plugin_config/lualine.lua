require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'nightfly',
  },
  sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = { "filename", "filesize", "lsp_progress", "macro_recording", "%S" },
      lualine_x = { "selectioncount", "searchcount", "lsp_client_name", "encoding", "fileformat", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
  }
}
