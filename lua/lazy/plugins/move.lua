return {
  'fedepujol/move.nvim',
  opts = {
      --- Config
  },
  config = function()
    require('move').setup({
      line = {
        enable = true, -- Enables line movement
        indent = true  -- Toggles indentation
      },
      block = {
        enable = true, -- Enables block movement
        indent = true  -- Toggles indentation
      },
      word = {
        enable = true, -- Enables word movement
      },
      char = {
        enable = false -- Enables char movement
      }
    })

    -- Normal-mode commands
    vim.keymap.set('n', '<C-j>', ':MoveLine(1)<CR>', { noremap = true, silent = true, desc = "Move line down" })
    vim.keymap.set('n', '<C-k>', ':MoveLine(-1)<CR>', { noremap = true, silent = true, desc = "Move line up" })
    vim.keymap.set('n', '<C-h>', ':MoveHChar(-1)<CR>', { noremap = true, silent = true, desc = "Move char left" })
    vim.keymap.set('n', '<C-l>', ':MoveHChar(1)<CR>', { noremap = true, silent = true, desc = "Move char right" })
    -- Visual-mode commands
    vim.keymap.set('v', '<C-j>', ':MoveBlock(1)<CR>', { noremap = true, silent = true, desc = "Move line down" })
    vim.keymap.set('v', '<C-k>', ':MoveBlock(-1)<CR>', { noremap = true, silent = true, desc = "Move line up" })
    vim.keymap.set('v', '<C-h>', ':MoveHBlock(-1)<CR>', { noremap = true, silent = true, desc = "Move block left" })
    vim.keymap.set('v', '<C-l>', ':MoveHBlock(1)<CR>', { noremap = true, silent = true, desc = "Move block right" })
  end
}
