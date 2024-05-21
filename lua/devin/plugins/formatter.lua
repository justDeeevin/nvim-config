return {
	"stevearc/conform.nvim",
	opts = {
		notify_on_error = false,
		format_on_save = {
			lsp_fallback = true,
			timeout_ms = 10000
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
			nix = { "nixpkgs_fmt" },
			scss = { "prettierd" },
			sh = { "beautysh" },
			tex = { "latexindent" }
		},
	},
}
