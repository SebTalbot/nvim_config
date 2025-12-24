---@type vim.lsp.Config
return {
	cmd = { "golangci-lint-langserver" },
	filetypes = { "go", "gomod" },
	root_markers = {
		".golangci.json",
		".golangci.toml",
		".golangci.yaml",
		".golangci.yml",
		"go.mod",
		"go.work",
		".git",
	},
	init_options = {
		command = {
			"golangci-lint",
			"run",
			"--output.json.path=stdout",
			"--show-stats=false",
		},
	},
}
