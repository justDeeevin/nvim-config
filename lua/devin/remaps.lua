vim.g.mapleader = " "

vim.keymap.set("i", "kj", "<Esc>")

-- Move selected lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

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
