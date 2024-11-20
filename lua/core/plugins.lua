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
    use 'nvim-tree/nvim-tree.lua'
    use 'nvim-tree/nvim-web-devicons'
    use 'nvim-treesitter/nvim-treesitter'
    use 'voldikss/vim-floaterm'
    use 'airblade/vim-gitgutter'

    use {
        'nvim-lualine/lualine.nvim',
        requires = {
            { 'yavorski/lualine-macro-recording.nvim' },
            { 'yavorski/lualine-lsp-progress.nvim' },
            { 'yavorski/lualine-lsp-client-name.nvim' },
        }
    }

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

    use {
        'kdheepak/lazygit.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
        },
    }
    use {
        'crnvl96/lazydocker.nvim',
        config = function()
            require('lazydocker').setup()
        end,
        requires = {
            'MunifTanjim/nui.nvim'
        }
    }
    use {
        'nvim-pack/nvim-spectre',
        requires = { 'nvim-lua/plenary.nvim' }
    }
    use {
        'folke/noice.nvim',
        requires = {
            'MunifTanjim/nui.nvim',
            'rcarriga/nvim-notify'
        },
    }
    use {
        'folke/todo-comments.nvim',
        requires = { 'nvim-lua/plenary.nvim' }
    }
  
    use {
        'neovim/nvim-lspconfig',
        requires = {
            'nvim-telescope/telescope.nvim',
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim'
        },
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

    -- ASCII drawing
    use 'jbyuki/venn.nvim'
    use {
        'Civitasv/cmake-tools.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
        },
    }

    use {
        'esensar/nvim-dev-container',
        requires = {
            'nvim-treesitter/nvim-treesitter',
        }
    }
    use 'fedepujol/move.nvim'

    use {
        'anurag3301/nvim-platformio.lua',
        requires = {
            {'akinsho/nvim-toggleterm.lua'},
            {'nvim-telescope/telescope.nvim'},
            {'nvim-lua/plenary.nvim'},
        }
    }

    use 'sindrets/diffview.nvim'
    use 'lukas-reineke/indent-blankline.nvim'

    -- colorschemes
    use 'ellisonleao/gruvbox.nvim'
    use 'folke/tokyonight.nvim'
    use { "catppuccin/nvim", as = "catppuccin" }

    if packer_bootstrap then
        require('packer').sync()
    end
end)
