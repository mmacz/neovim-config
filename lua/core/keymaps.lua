vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set('n', '<laeder>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>p', '"+p')
vim.keymap.set('v', '<leader>p', '"+p')

vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- Lazygit
vim.keymap.set('n', '<c-l>g', ':LazyGit<CR>', {})

-- NvimTree
vim.keymap.set('n', '<c-b>', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<c-f>', ':NvimTreeFindFile<CR>')

-- Telescope
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<Space>f', telescope.find_files, {})
vim.keymap.set('n', '<Space><Space>', telescope.oldfiles, {})
vim.keymap.set('n', '<Space>lg', telescope.live_grep, {})
vim.keymap.set('n', '<Space>ht', telescope.help_tags, {})

-- Floatterm
vim.keymap.set('n', '<C-n>', ":FloatermNew<CR>", {}) 
vim.keymap.set('t', '<C-t>', ":FloatermToggle<CR>", {})
vim.keymap.set('t', '<C-k>', ":FloatermKill!<CR>", {})

-- Fine cmdline
vim.keymap.set('n', '<leader>;', '<cmd>:FineCmdline<CR>', {noremap=true})
