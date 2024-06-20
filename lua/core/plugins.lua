local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'ellisonleao/gruvbox.nvim'
    use 'nvim-tree/nvim-tree.lua'
    use 'nvim-tree/nvim-web-devicons'
    use 'nvim-lualine/lualine.nvim'
    use 'nvim-treesitter/nvim-treesitter'
    use 'voldikss/vim-floaterm'
    use 'airblade/vim-gitgutter'

    use {
        'folke/which-key.nvim',
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require('which-key').setup {
            }
        end
    }
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        requires = {
            { 'nvim-lua/plenary.nvim' },
        }
    }

  -- use {
  -- 'Exafunction/codeium.vim',
  -- config = function ()
  --   -- Change '<C-g>' here to any keycode you like.
  --   vim.keymap.set('i', '<c-g>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
  --   vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
  --   vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
  --   vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
  --   end 
  -- }

    use {
        "kdheepak/lazygit.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
        },
    }
    use {
        "crnvl96/lazydocker.nvim",
        config = function()
            require("lazydocker").setup()
        end,
        requires = {
            "MunifTanjim/nui.nvim"
        }
    }
    use {
        "nvim-pack/nvim-spectre",
        requires = { "nvim-lua/plenary.nvim" }
    }
    use {
        "folke/noice.nvim",
        requires = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify"
        },
    }
    use {
        "folke/todo-comments.nvim",
        requires = { "nvim-lua/plenary.nvim" }
    }
  
    use {
        'neovim/nvim-lspconfig',
        requires = {
            'nvim-telescope/telescope.nvim',
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim'
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

                cmake = {},

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
                vim.keymap.set('n', '<leader>gd', telescope.lsp_definitions)
                vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration)
                vim.keymap.set('n', '<leader>gt', telescope.lsp_type_definitions)
                vim.keymap.set('n', '<leader>gi', telescope.lsp_implementations)
                vim.keymap.set('n', '<leader>gr', telescope.lsp_references)
                vim.keymap.set('n', '<leader>K', vim.lsp.buf.hover)
                vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename)
                vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)
                vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)
                vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
                vim.keymap.set('n', ']d', vim.diagnostic.goto_prev)
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
       end,
    }

    use 'simrat39/rust-tools.nvim'
    
    -- Completion framework
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'

    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-vsnip'                             
    use 'hrsh7th/cmp-path'                              
    use 'hrsh7th/cmp-buffer'                            
    use 'hrsh7th/vim-vsnip'

    if packer_bootstrap then
        require('packer').sync()
    end
end)
