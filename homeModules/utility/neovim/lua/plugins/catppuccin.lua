return {
	"catppuccin/nvim",
	lazy = false,
	name = "catppuccin",
	priority = 1000,
	config = function()
		-- require("catppuccin").setup({flavour = "mocha"})
		require("catppuccin").setup({
			flavour = "frappe",
			highlight_overrides = {
				frappe = function(frappe)
            return {
                LineNr = { fg = frappe.subtext0},
            }
        end,
			}
		})
		vim.cmd.colorscheme "catppuccin"
	end
}


