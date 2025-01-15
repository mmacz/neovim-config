return {
	-- "bluz71/vim-nightfly-colors", lazy = false, priority = 1000,
	--  "ellisonleao/gruvbox.nvim", lazy = false, priority = 1000,
	--  "folke/tokyonight.nvim", lazy = false, priority = 1000,
  -- "catppuccin/nvim", name = "catppuccin", priority = 1000,
  "dgox16/oldworld.nvim", lazy = false, priority = 1000,
	config = function()
		vim.cmd([[colorscheme oldworld]])
	end,
}

