return {
	"stevearc/conform.nvim",
	opts = {
		notify_on_error = false,
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
		formatters_by_ft = {
			lua = { "stylua" },
		python = { "black" },
			javascript = { "prettierd" },
			typescript = { "prettierd" },
			json = { "prettierd" },
			html = { "prettierd" },
			css = { "prettierd" },
			markdown = { "prettierd" },
			yaml = { "yamlfmt" },
			rust = { "rustfmt" },
			toml = { "taplo" },
			svelte = { "prettierd" },
		},
	},
}
