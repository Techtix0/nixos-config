return {
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			require("luasnip.loaders.from_lua").lazy_load({ paths = "./lua/snippets" })
			local ls = require("luasnip")
			ls.setup({
				update_events = { "TextChanged", "TextChangedI" },
				enable_autosnippets = true,
			})
		end
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require('cmp')
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					['<CR>'] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
					{ name = 'luasnip' },
				}, {
					{ name = 'buffer' },
				})
			})
		end,
	},

}
