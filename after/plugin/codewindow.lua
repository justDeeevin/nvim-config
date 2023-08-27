local codewindow = require("codewindow")

codewindow.setup({
    auto_enable = true,
    exclude_filetypes = { 'oil' }
})

codewindow.apply_default_keybinds()
