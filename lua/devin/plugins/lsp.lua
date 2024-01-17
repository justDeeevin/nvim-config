return {
	-- LSP Configuration & Plugins
	"neovim/nvim-lspconfig",
	dependencies = {
		-- Automatically install LSPs to stdpath for neovim
		-- Setup should be called first for mason and after for mason-lspconfig!
		{ "williamboman/mason.nvim" },
		"williamboman/mason-lspconfig.nvim",

		-- Additional lua configuration, makes nvim stuff amazing!
		"folke/neodev.nvim",
		"ray-x/lsp_signature.nvim",
	},

	config = function()
		-- [[ Configure LSP ]]

		-- Very important
		-- Load Mason first
		require("mason").setup()

		-- Setup neovim lua configuration
		require("neodev").setup()

		-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

		-- Should be loaded after mason
		-- Ensure the servers above are installed
		local mason_lspconfig = require("mason-lspconfig")

		mason_lspconfig.setup()

		-- Use this to avoid setting up servers you don't want
		local ignored_servers = {}

		mason_lspconfig.setup_handlers({
			function(server_name)
				if vim.tbl_contains(ignored_servers, server_name) then
					return
				end
				require("lspconfig")[server_name].setup({
					capabilities = capabilities,
				})
				if server_name == "rust_analyzer" then
					require("lspconfig").rust_analyzer.setup({
						settings = {
							["rust-analyzer"] = {
								checkOnSave = {
									command = "clippy",
								},
								inlayHints = {
									chainingHints = true,
									parameterHints = true,
									typeHints = true,
								},
								check = {
									allTargets = false,
								},
							},
						},
					})
				end
			end,
			["jdtls"] = function()
				local jdtls_s, _ = pcall(require, "jdtls")
				if jdtls_s then
					vim.api.nvim_create_autocmd("FileType", {
						pattern = { "java" },
						callback = function()
							require("jdtls").start_or_attach({
								cmd = {
									"jdtls",
									"--jvm-arg=" .. string.format(
										"-javaagent:%s",
										vim.fn.expand("$MASON/share/jdtls/lombok.jar")
									),
								},
								root_dir = vim.fs.dirname(
									vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]
								),
							})
						end,
					})
				else
					require("lspconfig")["jdtls"].setup({
						capabilities = capabilities,
					})
				end
			end,
		})

		-- Diagnostic message setup
		vim.diagnostic.config({
			-- Keep virtual text simple to avoid clutter
			virtual_text = {
				signs = true,
				severity_sort = true,
			},
			-- Use a custom format for the message in line diagnostics (E)
			float = {
				signs = true,
				severity_sort = true,
				format = function(diagnostic)
					return string.format("%s [%s] (%s)", diagnostic.message, diagnostic.code, diagnostic.source)
				end,
				suffix = "",
			},
		})

		-- Signature help
		require("lsp_signature").setup({
			bind = true,
			hint_enable = true,
			handler_opts = {
				border = "rounded",
			},
		})

		vim.keymap.set("n", "<leader>v", function()
			vim.diagnostic.open_float({ scope = "line" })
		end)
	end,
}
