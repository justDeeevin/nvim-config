vim.g.mapleader = " "

if os.getenv("COLEMAK") == "1" then
	vim.keymap.set("i", "en", "<Esc>", { desc = "Exit insert mode" })
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
	vim.keymap.set("i", "kj", "<Esc>")
	-- Move selected lines
	vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
	vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
end

vim.keymap.set("n", "<F2>", function()
	vim.lsp.buf.rename()
end)
