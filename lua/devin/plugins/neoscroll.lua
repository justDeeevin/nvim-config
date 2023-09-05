return {
    'karb94/neoscroll.nvim',
    config = function()
        require('neoscroll').setup({
            mappings = { '<C-d>', '<C-u>' }
        })
    end
}
