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

--- Plugins

--- CMake Tools
vim.keymap.set('n', '<leader>cmg', ':CMakeGenerate<CR>', { desc = "Generate Makefiles", noremap = true, silent = true })
vim.keymap.set('n', '<leader>cmb', ':CMakeBuild<CR>', { desc = "Build CMake target", noremap = true, silent = true })
vim.keymap.set('n', '<leader>cmr', ':CMakeRun<CR>', { desc = "Run CMake target", noremap = true, silent = true })
vim.keymap.set('n', '<leader>cmt', ':CMakeRunTest<CR>', { desc = "Execute CTest", noremap = true, silent = true })
vim.keymap.set('n', '<leader>cmc', ':CMakeClean<CR>', { desc = "Clean CMake cache", noremap = true, silent = true })

-- Conan
vim.keymap.set('n', "<leader>coi", ":Conan install<CR>", { desc = "Conan: install", noremap = true })
vim.keymap.set('n', "<leader>cob", ":Conan build<CR>", { desc = "Conan: build", noremap = true })
vim.keymap.set('n', "<leader>col", ":Conan lock<CR>", { desc = "Conan: lock", noremap = true })
vim.keymap.set('n', "<leader>coc", ":Conan create<CR>", { desc = "Conan: create", noremap = true })
vim.keymap.set('n', "<leader>coe", ":Conan export<CR>", { desc = "Conan: export", noremap = true })
vim.keymap.set('n', "<leader>cop", ":Conan export_package<CR>", { desc = "Conan: export_package", noremap = true })
vim.keymap.set('n', "<leader>cou", ":Conan upload<CR>", { desc = "Conan: upload", noremap = true })

--- DAP
local dap = require("dap")
vim.keymap.set("n", "<leader>db", function() dap.toggle_breakpoint() end, { desc = "DAP: Toggle breakpoint" })
vim.keymap.set("n", "<leader>dB", function() dap.toggle_breakpoint(vim.fn.input("Condition: ")) end, { desc = "DAP: Toggle conditional breakpoint" })
vim.keymap.set("n", "<leader>dso", function() dap.step_over() end, { desc = "DAP: Step over" })
vim.keymap.set("n", "<leader>dsi", function() dap.step_into() end, { desc = "DAP: Step into" })
vim.keymap.set("n", "<leader>dst", function() dap.step_out() end, { desc = "DAP: Step out" })
vim.keymap.set("n", "<leader>dc", function() dap.continue() end, { desc = "DAP: Continue" })
vim.keymap.set("n", "<leader>dt", function() dap.terminate() end, { desc = "DAP: Terminate " })

--- Floatterm
vim.keymap.set('n', '<leader>tt', ":FloatermToggle<CR>", { desc = "Floatterm: Toggle", noremap = true} )

--- Lazygit
vim.keymap.set('n', "<C-l>g", ":LazyGit<cr>", { desc = "Open lazy git", noremap = true })

--- LSP: refer to plugins.lsp

--- Move
vim.keymap.set({'n', 't'}, '<C-j>', ':MoveLine(1)<CR>', { noremap = true, silent = true, desc = "Move line down" })
vim.keymap.set({'n', 't'}, '<C-k>', ':MoveLine(-1)<CR>', { noremap = true, silent = true, desc = "Move line up" })
vim.keymap.set({'n', 't'}, '<C-h>', ':MoveHChar(-1)<CR>', { noremap = true, silent = true, desc = "Move char left" })
vim.keymap.set({'n', 't'}, '<C-l>', ':MoveHChar(1)<CR>', { noremap = true, silent = true, desc = "Move char right" })

--- none-ls
vim.keymap.set("n", "<leader>fo", vim.lsp.buf.format, { desc = "Format current file", noremap = true })

--- NvimTree
vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer", noremap = true })
vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file", noremap = true })

--- Render Markdown
vim.keymap.set("n", "<leader>rmd", ":RenderMarkdown toggle<CR>", { desc = "Render Markdown file", noremap = true })

--- Telescope
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
vim.keymap.set("n", "<leader><leader>", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
vim.keymap.set("n", "<leader>lg", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })

--- Rust Tools
vim.keymap.set("n", "<leader>rdb", ":RustDebuggables<CR>", { desc = "Rust Tools: Debuggables", noremap = true })
vim.keymap.set("n", "<leader>rtr", ":RustRunnables<CR>", { desc = "Rust Tools: Runnables", noremap = true })
vim.keymap.set("n", "<leader>rihs", ":RustSetInlayHints<CR>", { desc = "Rust Tools: Inlay hints set", noremap = true })
vim.keymap.set("n", "<leader>rihu", ":RustUnsetInlayHints<CR>", { desc = "Rust Tools: Inlay hints unset", noremap = true })
vim.keymap.set("n", "<leader>rha", ":RustHoverActions<CR>", { desc = "Rust Tools: Hover actions", noremap = true })
vim.keymap.set("n", "<leader>rfm", ":RustFmt<CR>", { desc = "Rust Tools: Format", noremap = true })

