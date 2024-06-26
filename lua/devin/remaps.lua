vim.g.mapleader = " "

if os.getenv("COLEMAK") == "1" then
	vim.keymap.set("i", "en", "<Esc>", { desc = "Exit insert mode" })
	vim.keymap.set("n", "s", "<Cmd>startinsert<CR>")
	vim.keymap.set({ "n", "o", "x" }, "n", "j")
	vim.keymap.set({ "n", "o", "x" }, "e", "k")
	vim.keymap.set({ "n", "o", "x" }, "i", "l")
	vim.keymap.set({ "n", "o", "x" }, "m", "h")
	vim.keymap.set({ "n", "o", "x" }, "k", "n")
	vim.keymap.set({ "n", "o", "x" }, "K", "N")
	vim.keymap.set({ "n", "o", "x" }, "h", "m")
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

vim.keymap.set("n", "<leader>v", vim.diagnostic.open_float, { desc = "[V]iew diagnistics for current line" })
