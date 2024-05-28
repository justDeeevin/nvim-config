if os.getenv("OS") == "Windows_NT" then
	return {}
else
	return {
		"3rd/image.nvim",
		opts = {},
	}
end
