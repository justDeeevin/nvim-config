return {'phaazon/hop.nvim', config = function()
	local hop = require('hop')
	hop.setup()
	local directions = require('hop.hint').HintDirection
	vim.keymap.set('', '<leader>l', function()
		hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
	end, { remap = true })
	vim.keymap.set('', '<leader>h', function()
		hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
	end, { remap = true })
	vim.keymap.set('', '<leader>w', vim.cmd.HopWordCurrentLine)
end
}
