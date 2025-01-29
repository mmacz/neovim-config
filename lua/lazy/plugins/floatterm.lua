return {
  "voldikss/vim-floaterm",
  config = function()
    vim.keymap.set('n', '<C-n>', ":FloatermNew<CR>", {})
  end
}
