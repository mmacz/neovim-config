vim.diagnostic.config({
    underline = {
        severity = vim.diagnostic.severity.ERROR,
    },
    update_in_insert = false,
    virtual_text = false,
    severity_sort = true,
})

local servers = {
    clangd = {},

    cmake = {},

    pyright = {},

    rust_analyzer = {
        cargo = {
            allFeatures = true,
            loadOutDirsFromCheck = true,
            runBuildScripts = true,
        },
        diagnostics = {
            enable = true,
            experimental = {
                enable = true,
            }
        },
    },

    lua_ls = {
        Lua = {
            diagnostics = { globals = {'vim'} },
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        },
    }
}

local on_attach = function()
    vim.o.signcolumn = 'yes:1'
    local telescope = require('telescope.builtin')
    vim.keymap.set('n', '<leader>gd', telescope.lsp_definitions, { desc = "LSP: Show definitions" } )
    vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, { desc = "LSP: Show declarations" } )
    vim.keymap.set('n', '<leader>gt', telescope.lsp_type_definitions, { desc = "LSP: Go to type definition" } )
    vim.keymap.set('n', '<leader>gi', telescope.lsp_implementations, { desc = "LSP: Go to implementations" } )
    vim.keymap.set('n', '<leader>gr', telescope.lsp_references, { desc = "LSP: Show references" } )
    vim.keymap.set('n', '<leader>K', vim.lsp.buf.hover, { desc = "LSP: Show information" } )
    vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, { desc = "LSP: Rename" } )
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "LSP: Code action" } )
    vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = "LSP: Diagnostics" } )
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "LSP: Go to previous diagnostic" } )
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "LSP: Go to next diagnostic" } )
end

require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = vim.tbl_keys(servers)
})
require('mason-lspconfig').setup_handlers({
    function(server_name)
        require('lspconfig')[server_name].setup({
            capabilities = vim.lsp.protocol.make_client_capabilities(),
            on_attach = on_attach,
            settings = servers[server_name],
            filetypes = (servers[server_name] or {}).filetypes,
        })
    end,
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {border = 'rounded'})
