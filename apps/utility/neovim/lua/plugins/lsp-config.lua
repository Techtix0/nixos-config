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
			require("mason-lspconfig").setup()
		end
	},
	{
		"neovim/nvim-lspconfig",
		-- For more lsps remember to install them in apps/services/lsp and import it in lsp.nix
		config = function()
			local lspconfig = require("lspconfig")
			-- Lua lsp
      lspconfig.lua_ls.setup({})

			-- Nix lsp
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

			-- keybinds
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>ac", vim.lsp.buf.code_action, {})
	end
	}
}

