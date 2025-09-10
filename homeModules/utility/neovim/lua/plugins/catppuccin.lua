return {
	"catppuccin/nvim",
	lazy = false,
	name = "catppuccin",
	priority = 1000, 
	config = function()
		-- require("catppuccin").setup({flavour = "mocha"})
		require("catppuccin").setup({flavour = "frappe"})
		vim.cmd.colorscheme "catppuccin"
	end
}


