return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
        debug = true,
        sources = {
          null_ls.builtins.diagnostics.clang_tidy,
          null_ls.builtins.formatting.clang_format.with({ extra_args = { "--style=file" }, }),
        },
    })
    vim.keymap.set("n", "<leader>fo", vim.lsp.buf.format, { desc = "Format current file" })
  end,
}
