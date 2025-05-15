return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
          'nvim-telescope/telescope.nvim',
          'mason-org/mason.nvim',
          'mason-org/mason-lspconfig.nvim',
        },

        config = function()

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

                neocmake = {},

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
                        },
                    },
                },

                lua_ls = {
                    Lua = {
                        diagnostics = {globals = {'vim'}},
                        telementry = {enable = false},
                        runtime = { version = "LuaJIT" },
                        workspace = {
                          checkThirdParty = false,
                          library = {
                            "${3rd}/luv/library",
                            unpack(vim.api.nvim_get_runtime_file("", true)),
                          },
                        },
                        completion = { callSnippet = "Replace" },
                    },
                },

                pyright = {},

                gopls = {},

                dockerls = {},

            }

            local on_attach = function()
                vim.o.signcolumn = 'yes:1'
                local telescope = require('telescope.builtin')
                vim.keymap.set('n', '<leader>gd', telescope.lsp_definitions, { desc = "LSP: Definitions" })
                vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, { desc = "LSP: Declarations" })
                vim.keymap.set('n', '<leader>gt', telescope.lsp_type_definitions, { desc = "LSP: Type definitions" })
                vim.keymap.set('n', '<leader>gi', telescope.lsp_implementations, { desc = "LSP: Implementations" })
                vim.keymap.set('n', '<leader>gr', telescope.lsp_references, { desc = "LSP: References" })
                vim.keymap.set('n', '<leader>K', vim.lsp.buf.hover, { desc = "LSP: Hover info" })
                vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, { desc = "LSP: Rename" })
                vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "LSP: Code action" })
                vim.keymap.set('n', '<leader>lsd', vim.diagnostic.open_float, { desc = "LSP: Open float diagnostics" })
                vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "LSP: Goto prev diagnostic" })
                vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "LSP: Goto next diagnostic" })
            end

            require('mason').setup({
              ui = {
                icons = {
                  package_installed = "✓",
                  package_pending = "➜",
                  package_uninstalled = "✗",
                },
              }
            })
            require('mason-lspconfig').setup({
                ensure_installed = vim.tbl_keys(servers),
                automatic_installation = true,
                automatic_enable = false,
            })

            for _, server_name in ipairs(require('mason-lspconfig').get_installed_servers()) do
              vim.lsp.config(server_name, {
                capabilities = vim.lsp.protocol.make_client_capabilities(),
                on_attach = on_attach,
              })
              vim.lsp.enable(server_name)
            end

            vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {border = 'rounded'})

        end,
    },
}
