vim.g.mapleader = " "

vim.keymap.set("n", "<leader>e", function()
    require('oil').open(nil)
    require('codewindow').close_minimap()
end)
vim.keymap.set("i", "kj", "<Esc>")

-- Move selected lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep search results in the center of the screen
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

local hop = require('hop')
local directions = require('hop.hint').HintDirection
vim.keymap.set('', '<leader>l', function()
    hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, { remap = true })
vim.keymap.set('', '<leader>h', function()
    hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, { remap = true })
vim.keymap.set('', '<leader>w', vim.cmd.HopWordCurrentLine)

local comment = require('Comment.api')
local esc = vim.api.nvim_replace_termcodes('<ESC>', true, false, true)
vim.keymap.set('n', '<C-_>', comment.toggle.linewise.current)
vim.keymap.set('x', '<C-_>', function()
    vim.api.nvim_feedkeys(esc, 'nx', false)
    comment.toggle.linewise(vim.fn.visualmode())
end)

vim.keymap.set('n', '<C-a>', function() vim.lsp.buf.code_action() end)
vim.keymap.set('n', 'gh', function() vim.lsp.buf.hover() end)
vim.keymap.set('n', '<F2>', function() vim.lsp.buf.rename() end)
vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end)
