return {
	-- "bluz71/vim-nightfly-colors",
	--  "ellisonleao/gruvbox.nvim",
	--  "folke/tokyonight.nvim",
  "catppuccin/nvim", name = "catppuccin", priority = 1000,
	config = function()
		vim.cmd([[colorscheme catppuccin]])
	end,
}

