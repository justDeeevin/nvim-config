return {
	"phaazon/hop.nvim",
	config = function()
		local hop = require("hop")
		hop.setup()
		local directions = require("hop.hint").HintDirection
		if os.getenv("COLEMAK") == "1" then
			vim.keymap.set("", "<leader>i", function()
				hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
			end, { remap = true })
			vim.keymap.set("", "<leader>h", function()
				hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
			end, { remap = true })
		else
			vim.keymap.set("", "<leader>l", function()
				hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
			end, { remap = true })
			vim.keymap.set("", "<leader>h", function()
				hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
			end, { remap = true })
		end
	end,
}
