return {
	"phaazon/hop.nvim",
	opts = {},
	config = function()
		local hop = require("hop")
		local directions = require("hop.hint").HintDirection
		if os.getenv("COLEMAK") == "1" then
			vim.keymap.set("", "<leader>i", function()
				hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
			end, { remap = true, desc = "Hop to a character after the cursor on the current line" })
			vim.keymap.set("", "<leader>m", function()
				hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
			end, { remap = true, desc = "Hop to a character before the cursor on the current line" })
		else
			vim.keymap.set("", "<leader>l", function()
				hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
			end, { remap = true, desc = "Hop to a character after the cursor on the current line" })
			vim.keymap.set("", "<leader>h", function()
				hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
			end, { remap = true, desc = "Hop to a character before the cursor on the current line" })
		end
	end,
}
