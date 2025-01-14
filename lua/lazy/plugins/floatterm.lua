return {
  "voldikss/vim-floaterm",
  config = function()
    vim.keymap.set('n', '<C-n>', ":FloatermNew<CR>", {})
    vim.keymap.set('t', '<C-t>', ":FloatermToggle<CR>", {})
    vim.keymap.set('t', '<C-k>', ":FloatermKill!<CR>", {})
  end
}
