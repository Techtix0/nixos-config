-- Picker for things such as files and live grep
return {
	"nvim-mini/mini.nvim", 
	version = "*",
	dependencies = {"nvim-tree/nvim-web-devicons"},

	config = function() 
		require('mini.pick').setup({
			mappings = {
				caret_left = "<left>",
				caret_right = "<right>",

				choose = "<CR>",
				choose_in_split = "<C-s>",
				choose_in_vsplit = "<C-v>",

				delete_char = "<BS>",
				delete_char_right = "<Del>",

				move_down = "<C-j>",
				move_up = "<C-k>",
			}
		})
		vim.keymap.set("n", "<C-p>", ":Pick files<CR>")
		vim.keymap.set("n", "<C-p>", ":Pick files<CR>")
	end
}
