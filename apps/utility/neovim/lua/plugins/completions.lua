return {
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		}
		config = function()
      require("luasnip.loaders.from_lua").lazy_load({ paths = "./lua/snippets" })
      local ls = require("luasnip")
      ls.setup({
          update_events = { "TextChanged", "TextChangedI" },
          enable_autosnippets = true,
          store_selection_keys = "<Tab>",
      })
      vim.keymap.set({ "i" }, "<C-k>", function() ls.expand() end, { silent = true, desc = "expand autocomplete" })
      vim.keymap.set({ "i", "s" }, "<C-j>", function() ls.jump(1) end, { silent = true, desc = "next autocomplete" })
      vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(-1) end, { silent = true, desc = "previous autocomplete" })
      vim.keymap.set({ "i", "s" }, "<C-E>", function()
          if ls.choice_active() then
              ls.change_choice(1)
          end
      end, { silent = true, desc = "select autocomplete" })
		end
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require 'cmp'
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-leader>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.abort(),
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
