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

-- Lazydocker
vim.keymap.set('n', '<c-l>d', ':LazyDocker<CR>', { desc = "Toggle LazyDocker", noremap = true, silent = true })

-- NvimTree
vim.keymap.set('n', '<c-b>', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<c-f>', ':NvimTreeFindFile<CR>')

-- Telescope
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', telescope.find_files, {})
vim.keymap.set('n', '<leader><leader>', telescope.oldfiles, {})
vim.keymap.set('n', '<leader>lg', telescope.live_grep, {})
vim.keymap.set('n', '<leader>ht', telescope.help_tags, {})

-- Floatterm
vim.keymap.set('n', '<C-n>', ":FloatermNew<CR>", {}) 
vim.keymap.set('t', '<C-t>', ":FloatermToggle<CR>", {})
vim.keymap.set('t', '<C-k>', ":FloatermKill!<CR>", {})

-- nvim-spectre
vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {desc = "Toggle Spectre"})
vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {desc = "Search current word"})
vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {desc = "Search current word"})
vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {desc = "Search on current file"})
