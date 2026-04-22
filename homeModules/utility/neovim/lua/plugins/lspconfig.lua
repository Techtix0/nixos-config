-- LSP configuration
return {
	"neovim/nvim-lspconfig",
	lazy = false,

	-- TODO: lspconfig will be deprecated. Check docs for conversion to vim.lsp.config
	-- For more LSPs remember to install them in modules/services/lsp and import it in lsp.nix
	config = function()
		local lspconfig = require("lspconfig")

		-- Lua lsp
		vim.lsp.enable( "lua_ls" )

		-- Python lsp
		vim.lsp.enable( "pylsp" )

		-- Nix lsp
		vim.lsp.config["nixd"] = {
			settings = {
				nixd = {
					formatting = {
						command = { "alejandra" },
					},
				},
			},
		}

		-- Rust lsp
		vim.lsp.config["rust_analyzer"] = {
			cmd = { "rust-analyzer" },
			settings = {
				formatting = {
					command = { "rustfmt" },
				},
			},
		}

		-- Html lsp
		vim.lsp.enable( "html" )

		-- keybinds
		vim.keymap.set("n", "K", vim.lsp.buf.hover)
		vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition)
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
		vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
	end
}
