return {
	"numtostr/comment.nvim",
	lazy = false,
	opts = { mappings = false },
	config = function()
		local map
		if os.getenv("OS") == "Windows_NT" then
			map = "<C-_>"
		else
			map = "<C-/>"
		end

		local comment = require("Comment.api")
		local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
		vim.keymap.set("n", map, comment.toggle.linewise.current)
		vim.keymap.set("x", map, function()
			vim.api.nvim_feedkeys(esc, "nx", false)
			comment.toggle.linewise(vim.fn.visualmode())
		end)
	end,
}
