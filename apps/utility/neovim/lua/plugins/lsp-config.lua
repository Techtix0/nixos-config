return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {"lua_ls", "nixd"}
			})
		end
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_lsp.setup({})
			lspconfig.nixd.setup({
				cmd = {"nixd"},
				settings = {
					nixd = {
						nixpkgs = {
							expr = "import <nixpkgs> { }",
						},
					},
				},
			})
		end
	}
}
