-- LSP configuration
return {
	"neovim/nvim-lspconfig",
	lazy = false,

	-- For more LSPs remember to install them in modules/services/lsp and import it in lsp.nix
	config = function()
		local lspconfig = require("lspconfig")

		-- Lua lsp
		lspconfig.lua_ls.setup({})

		-- Python lsp
		lspconfig.pylsp.setup({})

		-- Nix lsp
		lspconfig.nixd.setup({
			settings = {
				nixd = {
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
				formatting = {
					command = { "rustfmt" },
				},
			},
		})

		-- Html lsp
		lspconfig.html.setup({})

		-- keybinds
		vim.keymap.set("n", "K", vim.lsp.buf.hover)
		vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition)
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
		vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
	end
}
