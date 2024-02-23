vim.g.mapleader = " "

vim.keymap.set("i", "en", "<Esc>")

-- Move selected lines
vim.keymap.set("v", "E", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "N", ":m '<-2<CR>gv=gv")

-- Keep search results in the center of the screen
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<C-a>", function()
	vim.lsp.buf.code_action()
end)
vim.keymap.set("n", "gh", function()
	vim.lsp.buf.hover()
end)
vim.keymap.set("n", "<F2>", function()
	vim.lsp.buf.rename()
end)
vim.keymap.set("n", "gd", function()
	vim.lsp.buf.definition()
end)

vim.keymap.set("n", "<C-h>", function()
	pcall(function()
		vim.lsp.inlay_hint.enable(0, not vim.lsp.inlay_hint.is_enabled())
	end)
end)
