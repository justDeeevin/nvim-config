return {
	"ThePrimeAgen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {},
	config = function()
		local harpoon = require("harpoon")
		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end, { desc = "Scewer current file (harpoon)" })
		vim.keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)
	end,
}
