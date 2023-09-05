return {'numtostr/comment.nvim', config = function()
    require('Comment').setup({
        mappings = false,
    })
    local comment = require('Comment.api')
    local esc = vim.api.nvim_replace_termcodes('<ESC>', true, false, true)
    vim.keymap.set('n', '<C-_>', comment.toggle.linewise.current)
    vim.keymap.set('x', '<C-_>', function()
	    vim.api.nvim_feedkeys(esc, 'nx', false)
	    comment.toggle.linewise(vim.fn.visualmode())
    end)
end
}
