return {
	"bluz71/vim-nightfly-colors",
  "ellisonleao/gruvbox.nvim",
  "folke/tokyonight.nvim",
	priority = 1000,
	config = function()
		vim.cmd([[colorscheme tokyonight-night]])
	end,
}

