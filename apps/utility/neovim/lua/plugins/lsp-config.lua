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
		-- For more lsps remember to install them in apps/services/lsp and import it in lsp.nix
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

			-- gdscipt lsp
			lspconfig.gdscript.setup()

			-- keybinds
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>ac", vim.lsp.buf.code_action, {})

			-- A keymap that starts the server for godot LSP and DAP
			vim.keymap.set("n", "<leader>sg", function()
				vim.fn.serverstart("127.0.0.1:6004")
			end, {noremap = true})
		end
	}
}
