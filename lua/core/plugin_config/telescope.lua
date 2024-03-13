local builtin = require('telescope.builtin')

vim.keymap.set('n', '<c-f>f', builtin.find_files, {})
vim.keymap.set('n', '<Space><Space>', builtin.oldfiles, {})
vim.keymap.set('n', '<Space>lg', builtin.live_grep, {})
vim.keymap.set('n', '<Space>ht', builtin.help_tags, {})
