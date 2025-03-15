return {
  "voldikss/vim-floaterm",
  config = function()
    vim.keymap.set('n', '<leader>tt', ":FloatermToggle<CR>", {})
  end
}
