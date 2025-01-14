return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    local header = string.format([[

 _   _      _ _      ______    _                _
| | | |    | | |     |  ___|  (_)              | |
| |_| | ___| | | ___ | |_ _ __ _  ___ _ __   __| |
|  _  |/ _ \ | |/ _ \|  _| '__| |/ _ \ '_ \ / _` |
| | | |  __/ | | (_) | | | |  | |  __/ | | | (_| |
\_| |_/\___|_|_|\___/\_| |_|  |_|\___|_| |_|\__,_|

    ]])
    -- Set header
    dashboard.section.header.val = header

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
      dashboard.button("SPC ee", "  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
      dashboard.button("SPC ff", "󰱼 > Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("SPC fs", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("SPC wr", "󰁯  > Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
      dashboard.button("q", " > Quit NVIM", "<cmd>qa!<CR>"),
    }

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
