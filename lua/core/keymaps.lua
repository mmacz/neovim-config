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
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>dcs', ':DevcontainerStart<CR>', { desc = "Start devcontainer", noremap = true, silent = true })
vim.keymap.set('n', '<leader>dca', ':DevcontainerAttach bash<CR>', { desc = "Attach to devcontainer bash shell", noremap = true, silent = true })
vim.keymap.set('n', '<leader>dcp', ':DevcontainerStop<CR>', { desc = "Stop devcontainer", noremap = true, silent = true })

-- CMake Tools
vim.keymap.set('n', '<leader>cmg', ':CMakeGenerate<CR>', { desc = "Generate Makefiles", noremap = true, silent = true })
vim.keymap.set('n', '<leader>cmb', ':CMakeBuild<CR>', { desc = "Build CMake target", noremap = true, silent = true })
vim.keymap.set('n', '<leader>cmr', ':CMakeRun<CR>', { desc = "Run CMake target", noremap = true, silent = true })
vim.keymap.set('n', '<leader>cmt', ':CMakeRunTest<CR>', { desc = "Execute CTest", noremap = true, silent = true })
vim.keymap.set('n', '<leader>cmc', ':CMakeClean<CR>', { desc = "Clean CMake cache", noremap = true, silent = true })

-- Lazygit
vim.keymap.set('n', '<c-l>g', ':LazyGit<CR>', {})

-- Lazydocker
vim.keymap.set('n', '<c-l>d', ':LazyDocker<CR>', { desc = "Toggle LazyDocker", noremap = true, silent = true })

-- NvimTree
vim.keymap.set('n', '<c-t>t', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<c-t>f', ':NvimTreeFindFile<CR>')

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

-- move
-- Normal-mode commands
vim.keymap.set('n', '<C-j>', ':MoveLine(1)<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', ':MoveLine(-1)<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-h>', ':MoveHChar(-1)<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', ':MoveHChar(1)<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>wf', ':MoveWord(1)<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>wb', ':MoveWord(-1)<CR>', { noremap = true, silent = true })
-- Visual-mode commands
vim.keymap.set('v', '<C-j>', ':MoveBlock(1)<CR>', { noremap = true, silent = true })
vim.keymap.set('v', '<C-k>', ':MoveBlock(-1)<CR>', { noremap = true, silent = true })
vim.keymap.set('v', '<C-h>', ':MoveHBlock(-1)<CR>', { noremap = true, silent = true })
vim.keymap.set('v', '<C-l>', ':MoveHBlock(1)<CR>', { noremap = true, silent = true })

-- lsp
vim.keymap.set('n', '<leader>gd', telescope.lsp_definitions, { desc = "LSP: Definitions" })
vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, { desc = "LSP: Declarations" })
vim.keymap.set('n', '<leader>gt', telescope.lsp_type_definitions, { desc = "LSP: Type definitions" })
vim.keymap.set('n', '<leader>gi', telescope.lsp_implementations, { desc = "LSP: Implementations" })
vim.keymap.set('n', '<leader>gr', telescope.lsp_references, { desc = "LSP: References" })
vim.keymap.set('n', '<leader>K', vim.lsp.buf.hover, { desc = "LSP: Hover info" })
vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, { desc = "LSP: Rename" })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "LSP: Code action" })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = "LSP: Open float diagnostics" })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "LSP: Goto prev diagnostic" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "LSP: Goto next diagnostic" })

-- rust-tools
-- vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
-- vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })

-- venn
-- vim.api.nvim_set_keymap('n', '<leader>v', ":lua Toggle_venn()<CR>", { noremap = true})
-- vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", {noremap = true})
-- vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", {noremap = true})
-- vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", {noremap = true})
-- vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", {noremap = true})
-- -- draw a box by pressing "f" with visual selection
-- vim.api.nvim_buf_set_keymap(0, "v", "f", ":VBox<CR>", {noremap = true})
