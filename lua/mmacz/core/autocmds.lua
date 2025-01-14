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

