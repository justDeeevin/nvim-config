vim.g.mapleader = " "

if os.getenv("COLEMAK") == "1" then
	vim.keymap.set("i", "en", "<Esc>")
	vim.keymap.set("n", "s", "<Cmd>startinsert<CR>")
	vim.keymap.set({ "n", "o", "x" }, "n", "<Down>")
	vim.keymap.set({ "n", "o", "x" }, "e", "<Up>")
	vim.keymap.set({ "n", "o", "x" }, "i", "<Right>")
	vim.keymap.set({ "n", "o", "x" }, "k", function()
		vim.fn.search(vim.fn.histget("search", -1))
	end)
	vim.keymap.set({ "n", "o", "x" }, "K", function()
		vim.fn.search(vim.fn.histget("search", -1), "b")
	end)
	-- Move selected lines
	vim.keymap.set("v", "N", ":m '>+1<CR>gv=gv")
	vim.keymap.set("v", "E", ":m '<-2<CR>gv=gv")
else
	vim.keymap.set("i", "jk", "<Esc>")
	-- Move selected lines
	vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
	vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
end

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
