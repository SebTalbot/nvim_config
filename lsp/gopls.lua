---@type vim.lsp.Config
return {
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl", "gosum" },
	root_markers = {
		"go.mod",
		"go.work",
		".git",
	},
	settings = {
		gopls = {
			gofumpt = true,
			buildFlags = { "-tags=integration,unit" },
		},
	},
}
