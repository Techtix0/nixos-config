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
			-- local lspconfig = require("lspconfig")

			vim.lsp.enable({"lua_ls"})

			-- keybinds
			vim.keymap.set("i", "<C-.>", vim.lsp.buf.hover)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition)
			vim.keymap.set("n", "<leader>ac", vim.lsp.buf.code_action)
			vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
		end
	}
}

