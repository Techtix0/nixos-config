-- Syntax highlighting
return {
	"nvim-treesitter/nvim-treesitter",
	branch = 'master',
	lazy = false,
	build = ":TSUpdate",

	config = function()
		require("nvim-treesitter.configs").setup {
			ensure_installed = { "lua", "nix", "rust", "python" },
			highlight = { enable = true },
			auto_install = false,
		}
	end
}
