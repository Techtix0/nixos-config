-- LSP configuration
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
		lazy = false,
		-- For more lsps remember to install them in modules/services/lsp and import it in lsp.nix
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			-- Lua lsp
			lspconfig.lua_ls.setup({
				capabilities = capabilities
			})

			-- Nix lsp
			lspconfig.nixd.setup({
				cmd = { "nixd" },
				settings = {
					nixd = {
						nixpkgs = {
							expr = "import <nixpkgs> { }",
						},
						formatting = {
							command = { "alejandra" },
						},
					},
				},
			})

			-- Rust lsp
			lspconfig.rust_analyzer.setup({
				cmd = { "rust-analyzer" },
				settings = {
					rust_analyzer = {
						nixpkgs = {
							expr = "import <nixpkgs> { }",
						},
						formatting = {
							command = { "rustfmt" },
						},
					},
				},
			})

			-- Python lsp
			lspconfig.pylsp.setup({})

			-- keybinds
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>ac", vim.lsp.buf.code_action, {})
		end
	}
}
