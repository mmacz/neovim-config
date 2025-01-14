vim.g.mapleader = " "

vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>p', '"+p')
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>wt', [[:%s/\s\+$//e<CR>]], { noremap =  true, silent = true, desc = "Trim trailing whitespaces" })
vim.keymap.set('n', '<leader>q', ':q', { noremap = true, silent = true, desc = "Quit" })
vim.keymap.set('n', '<leader>qq', ':q!', { noremap = true, silent = true, desc = "Force quit" })
vim.keymap.set('n', '<leader>qqq', ':qa!', { noremap = true, silent = true, desc = "Quit that should've listened" })
vim.keymap.set('n', '<leader>w', ':w', { noremap = true, silent = true, desc = "Save" })
vim.keymap.set('n', '<leader>wq', ':wq!', { noremap = true, silent = true, desc = "Save and quit" })
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')

