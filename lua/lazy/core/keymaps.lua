vim.g.mapleader = " "

vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>p', '"+p')
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>wt', [[:%s/\s\+$//e<CR>]], { noremap =  true, silent = true, desc = "Trim trailing whitespaces" })
vim.keymap.set('n', '<leader>q', ':q<CR>', { noremap = true, silent = true, desc = "Quit" })
vim.keymap.set('n', '<leader>qq', ':q!<CR>', { noremap = true, silent = true, desc = "Force quit" })
vim.keymap.set('n', '<leader>qqq', ':qa!<CR>', { noremap = true, silent = true, desc = "Quit that should've listened" })
vim.keymap.set('n', '<leader>w', ':w<CR>', { noremap = true, silent = true, desc = "Save" })
vim.keymap.set('n', '<leader>wq', ':wq!<CR>', { noremap = true, silent = true, desc = "Save and quit" })
vim.keymap.set('v', '>', '>gv', { noremap = true, desc = "Indent right" })
vim.keymap.set('v', '<', '<gv', { noremap = true, desc = "Unindent left" })
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { noremap = true, desc = "Exit terminal mode" })

