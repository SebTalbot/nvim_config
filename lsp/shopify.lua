---@type vim.lsp.Config
return {
	cmd = { "shopify", "theme", "language-server" },
	filetypes = { "liquid", "html", "css", "scss", "javascript", "json" },
	root_markers = {
		".shopifyignore",
		"config/settings_schema.json",
		"layout/theme.liquid",
		".git",
	},
}
