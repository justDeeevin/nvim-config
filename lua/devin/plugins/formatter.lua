return {
    "mhartington/formatter.nvim",
    config = function()
        local util = require("formatter.util")
        require("formatter").setup({

            filetype = {
                lua = { require("formatter.filetypes.lua").stylua },
                typescript = {
                    require("formatter.filetypes.typescript").prettierd,
                    require("formatter.filetypes.typescript").eslint_d,
                },
                javascript = {
                    require("formatter.filetypes.typescript").prettierd,
                    require("formatter.filetypes.typescript").eslint_d,
                },
                python = { require("formatter.filetypes.python").black },
                rust = { require("formatter.filetypes.rust").rustfmt },
                html = { require("formatter.filetypes.html").prettierd },
                css = { require("formatter.filetypes.css").prettierd },
                json = { require("formatter.filetypes.json").prettierd },
                markdown = { require("formatter.filetypes.markdown").prettierd },
                yaml = { require("formatter.filetypes.yaml").yamlfmt },
                toml = { require("formatter.filetypes.toml").taplo },
                svelte = {
                    function()
                        return {
                            exe = "prettierd",
                            args = { util.escape_path(util.get_current_buffer_file_path()) },
                            stdin = true,
                        }
                    end,
                },
            },
        })

        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
            callback = function()
                vim.api.nvim_command("FormatWrite")
            end,
        })
    end,
}
