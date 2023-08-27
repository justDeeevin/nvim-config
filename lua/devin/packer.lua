-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    use {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use 'folke/tokyonight.nvim'

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

    use 'ThePrimeAgen/harpoon'

    use 'mbbill/undotree'

    use 'tpope/vim-fugitive'

    use 'hrsh7th/nvim-cmp'

    use 'hrsh7th/cmp-nvim-lsp'

    use 'hrsh7th/cmp-buffer'

    use 'hrsh7th/cmp-path'

    use 'saadparwaiz1/cmp_luasnip'

    use 'rafamadriz/friendly-snippets'

    use 'williamboman/mason.nvim'

    use 'williamboman/mason-lspconfig.nvim'

    use 'ray-x/lsp_signature.nvim'

    use 'neovim/nvim-lspconfig'

    use 'L3MON4D3/LuaSnip'

    use 'lewis6991/gitsigns.nvim'

    use {
        'zbirenbaum/copilot.lua',
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require('copilot').setup({
                panel = {
                    enabled = false,
                },
                suggestion = {
                    enabled = true,
                    auto_trigger = true,
                    debounce = 75,
                    keymap = {
                        accept = false,
                        accept_word = false,
                        accept_line = false,
                        next = "<M-]>",
                        prev = "<M-[>",
                        dismiss = "<C-]>",
                    },
                },
                filetypes = {
                    yaml = false,
                    markdown = false,
                    help = false,
                    gitcommit = false,
                    gitrebase = false,
                    hgcommit = false,
                    svn = false,
                    cvs = false,
                    oil = false,
                    ["."] = false,
                },
                copilot_node_command = "node"
            })
        end,
    }

    use 'onsails/lspkind.nvim'

    use 'phaazon/hop.nvim'

    use 'numtostr/comment.nvim'

    use 'mhartington/formatter.nvim'

    use 'nvim-lualine/lualine.nvim'

    use 'windwp/nvim-autopairs'

    use 'nvim-tree/nvim-web-devicons'

    use 'stevearc/oil.nvim'

    use 'stevearc/dressing.nvim'

    use 'lukas-reineke/indent-blankline.nvim'

    use 'hiphish/rainbow-delimiters.nvim'

    use 'gorbit99/codewindow.nvim'
end)
