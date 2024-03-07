return {
	"gorbit99/codewindow.nvim",
	dependencies = { { "stevearc/oil.nvim" } },
	config = function()
		local codewindow = require("codewindow")

		codewindow.setup({
			auto_enable = true,
			exclude_filetypes = { "oil" },
		})

		codewindow.apply_default_keybinds()

		vim.keymap.set("n", "<leader>e", function()
			require("oil").open()
			require("codewindow").close_minimap()
		end, { desc = "Open oil window" })
	end,
}
