return {'mhartington/formatter.nvim', config = function()
	local format_is_enabled = true
	vim.api.nvim_create_user_command("LspFormatToggle", function()
		format_is_enabled = not format_is_enabled
	end, {})

	vim.api.nvim_create_user_command("LspFormat", function()
		vim.lsp.buf.format()
	end, {})

	local _augroups = {}
	local get_formatting_augroup = function(client)
		if not _augroups[client.id] then
			local group_name = "lsp-attach-" .. client.name
			local id = vim.api.nvim_create_augroup(group_name, { clear = true})
			_augroups[client.id] = id
		end

		return _augroups[client.id]
	end

	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("lsp-attach-main", { clear = true }),
		callback = function(args)
			local client_id = args.data.client_id
			local client = vim.lsp.get_client_by_id(client_id)
			local bufnr = args.buf
			local buf_ft = vim.bo.filetype

			if client == nil or bufnr == nil then
				return
			end

			vim.api.nvim_create_autocmd("BufWritePre", {
				group = get_formatting_augroup(client),
				buffer = bufnr,
				callback = function()
					if not client.server_capabilities.documentFormattingProvider then
						return
					end

					if not format_is_enabled then
						return
					end

					vim.lsp.buf.format({
						async = false,
						filter = function(c)
							return c.id == client.id
						end,
					})

					vim.diagnostic.enable(bufnr)
				end,
			})
		end
	})
end
}
