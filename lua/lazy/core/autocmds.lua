vim.api.nvim_create_autocmd('BufWritePre', {
    group = vim.api.nvim_create_augroup('RemoveTrailingWhitespace', {clear = true}),
    pattern = {
        '*.c', '*.cpp', '*.h', '*.hpp',
        'CMake*',
        '*.lua',
        'Makefile',
        '*.rs',
    },
    command = '%s/\\s\\+$//e',
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = ".vscode/launch.json",
  callback = function()
    require('dap.ext.vscode').load_launchjs(nil, { lldb = { "c", "cpp", "rust" } })
    print("Reloaded launch.json file.")
  end
})

vim.opt.number = true
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave" }, {
  callback = function()
    vim.wo.relativenumber = true
  end,
})
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter" }, {
  callback = function()
    vim.wo.relativenumber = false
  end,
})

