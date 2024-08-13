require 'nvim-treesitter.configs'.setup{
    ensure_installed = {"c", "cpp", "lua", "rust", "python", "vim", "regex", "markdown_inline", "jsonc"},
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
    },
}
