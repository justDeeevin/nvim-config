return {
    'hrsh7th/nvim-cmp', dependencies = {{'L3MON4D3/LuaSnip', 'onsails/lspkind.nvim'}}, config = function()
        local cmp = require 'cmp'
        local luasnip = require("luasnip")
        local lspkind = require("lspkind")
        local select_opts = { behavior = cmp.SelectBehavior.Select }

        require('luasnip.loaders.from_vscode').lazy_load()
        luasnip.config.setup({})

        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

        cmp.setup({
            preselect = "item",
            completion = {
                completeopt = "menu,menuone,noinsert",
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            formatting = {
                format = lspkind.cmp_format({
                    mode = "symbol_text",
                    maxwidth = 50,
                    ellipsis_char = "...",
                }),
            },
            experimental = {
                ghost_text = false,
            },

            mapping = cmp.mapping.preset.insert({
                ["<Down>"] = cmp.mapping.select_next_item(sepect_opts),
                ["<Up>"] = cmp.mapping.select_prev_item(select_opts),
                ["<Esc>"] = cmp.mapping.abort(),
                ["<C-Space>"] = cmp.mapping.complete({}),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    local copilot_available, copilot_suggestion = pcall(require, "copilot.suggestion")

                    if copilot_available and copilot_suggestion.is_visible() then
                        copilot_suggestion.accept()
                    elseif luasnip.expand_or_locally_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            }),
            sources = {
                { name = "nvim_lsp" },
                { name = "luasnip", keyword_length = 2 },
                { name = "buffer",  keyword_length = 3 },
                { name = "path" },
            },
        })
    end
}
