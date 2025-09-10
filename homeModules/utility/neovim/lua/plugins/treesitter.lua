return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup{
			ensure_installed = {"lua", "nix"},
			highlight = {enable = true},

			auto_install = false,
		}
	end
}

