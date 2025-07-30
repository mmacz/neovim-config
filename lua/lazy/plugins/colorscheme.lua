return {
  "ellisonleao/gruvbox.nvim", lazy = false, priority = 1000,
	config = function()
    vim.o.background = "dark"
		vim.cmd([[colorscheme gruvbox]])

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
    vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
	end,
}

