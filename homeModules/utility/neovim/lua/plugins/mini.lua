return {
	{
		-- Surround plugin for surround actions.
			-- Add surrounding with `sa` (in visual mode or on motion).
			-- Delete surrounding with `sd`.
			-- Replace surrounding with `sr`.
			-- Find surrounding with sf or `sF` (move cursor right or left).
			-- Highlight surrounding with `sh`.
		"nvim-mini/mini.surround", version = "*",
		config = function()
			require("mini.surround").setup()
		end,
	},
	{
		-- Pairs plugin for auto-pairing.
		"nvim-mini/mini.pairs", version = "*",
		config = function ()
			require("mini.pairs").setup()
		end
	},
	{
		-- Align plugin to simply align text.
		-- Start aligning selected text with "ga".
			-- Press "s" to enter split Lua pattern.
			-- Press "j" to choose justification side from available ones (“left”, “center”, “right”, “none”).
			-- Press "m" to enter merge delimiter.
			-- Press "f" to enter filter Lua expression to configure which parts will be affected (like “align only first column”).
			-- Press "i" to ignore some commonly unwanted split matches.
			-- Press "p" to pair neighboring parts so they be aligned together.
			-- Press "t" to trim whitespace from parts.
			-- Press "<BS>" (backspace) to delete some last pre-step.
		"nvim-mini/mini.align", version = "*",
		config = function ()
			require("mini.align").setup()
		end
	}
}

