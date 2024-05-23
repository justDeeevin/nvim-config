local icons = {
	python = "",
	node = "",
	java = "",
	go = "",
}
-- Used by the runtime spec component
-- We cache the results of the runtime spec component so we don't have to run the
-- expensive "--version" commands
local runtime_cache = {
	node = nil,
	python = nil,
	java = nil,
	go = nil,
}

-- This stands for web development buffer selections i swear
local web_dev_bs = { "javascript", "javascriptreact", "typescript", "typescriptreact" }

local function get_attached_clients()
	local buf_clients = vim.lsp.get_clients({ bufnr = 0 })
	if #buf_clients == 0 then
		return "LSP Inactive"
	end

	local buf_client_names = {}

	-- add client
	for _, client in pairs(buf_clients) do
		table.insert(buf_client_names, client.name)
	end

	-- This needs to be a string only table so we can use concat below
	local unique_client_names = {}
	for _, name in pairs(buf_client_names) do
		if not vim.tbl_contains(unique_client_names, name) then
			table.insert(unique_client_names, name)
		end
	end

	local client_names_str = table.concat(unique_client_names, ", ")
	local language_servers = string.format("[%s]", client_names_str)

	return language_servers
end

-- Excerpt from Lunarvim
local function get_python_venv()
	local venv_cleanup = function(venv)
		if string.find(venv, "/") then
			local final_venv = venv
			for w in venv:gmatch("([^/]+)") do
				final_venv = w
			end
			venv = final_venv
		end
		return venv
	end

	-- This works for venv, poetry, conda, etc.
	local venv = os.getenv("CONDA_DEFAULT_ENV") or os.getenv("VIRTUAL_ENV")
	local py_version = vim.fn.system("python3 -V")
	py_version = py_version:gsub("\n", "")
	py_version = py_version:gsub("Python ", "")

	if venv then
		return string.format("%s %s", icons.python, venv_cleanup(venv))
	end

	return string.format("%s %s", icons.python, py_version)
end

local function get_java_version()
	local jdk_version = vim.fn.system("java --version 2>&1 | head -n 1")

	if jdk_version == "" then
		return nil
	end
	jdk_version = jdk_version:gsub(" (202%d-.-)$", "")

	return string.format(icons.java .. " %s", jdk_version:gsub("\n", ""))
end

local function get_node_version()
	local node_version = vim.fn.system("node --version")

	if node_version == "" then
		return nil
	end

	return string.format(icons.node .. " %s", node_version:gsub("\n", ""))
end

local function get_go_version()
	local go_path = vim.fn.system("which go")
	if go_path == "" then
		return nil
	end
	go_path = go_path:gsub("\n", "")
	local go_command = go_path .. " version"
	local go_version = vim.fn.system(go_command)
	if #go_version > 0 then
		-- Match 'go' followed by any numbers until whitespace
		go_version = go_version:match("go[%d%.]+")
		go_version = go_version:gsub("go", "")
	end

	return string.format(icons.go .. " %s", go_version)
end

local function build_runtime_spec_component()
	local buf_ft = vim.bo.filetype
	if vim.tbl_contains(web_dev_bs, buf_ft) then
		local node_version = runtime_cache.node or get_node_version()
		runtime_cache.node = node_version
		return {
			node_version,
			color = {
				fg = "#f7df1e",
				bg = "#1E1E1E",
			},
		}
	elseif buf_ft == "python" then
		local python_venv = runtime_cache.python or get_python_venv()
		runtime_cache.python = python_venv
		return {
			python_venv,
			color = {
				fg = "#6082B6",
				bg = "#1E1E1E",
			},
		}
	elseif buf_ft == "java" then
		local java_version = runtime_cache.java or get_java_version()
		runtime_cache.java = java_version
		return {
			java_version,
			color = {
				fg = "#9b3928",
				bg = "#1E1E1E",
			},
		}
	elseif buf_ft == "go" then
		local go_version = runtime_cache.go or get_go_version()
		runtime_cache.go = go_version
		return {
			go_version,
			color = {
				fg = "#00ADD8",
				bg = "#1E1E1E",
			},
		}
	end

	return nil
end

return {
	"nvim-lualine/lualine.nvim",
	event = { "VimEnter", "BufReadPost", "BufNewFile" },
	config = function()
		local attached_clients_component = {
			get_attached_clients,
			color = {
				gui = "bold",
			},
		}

		local spaces_component = {
			function()
				local shiftwidth = vim.api.nvim_get_option_value("shiftwidth", {})
				return "󰌒 " .. shiftwidth
			end,
			padding = 1,
		}

		local runtime_spec_component = {
			function()
				local component = build_runtime_spec_component()
				if component then
					return component[1]
				end
			end,
			color = function()
				local component = build_runtime_spec_component()
				if component then
					return component.color
				end
			end,
			cond = function()
				local component = build_runtime_spec_component()
				return component ~= nil and component[1] ~= nil
			end,
		}

		require("lualine").setup({
			options = {
				theme = "auto",
				globalstatus = true,
				component_separators = { left = "", right = "" },
				refresh = {
					statusline = 200,
				},
			},

			sections = {
				lualine_b = { "branch" },
				lualine_c = { "filename" },
				lualine_d = { "diff", runtime_spec_component },
				lualine_x = {
					"diagnostics",
					attached_clients_component,
					spaces_component,
					"filetype",
				},
			},
		})
	end,
}
