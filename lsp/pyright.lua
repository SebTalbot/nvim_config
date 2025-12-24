---@type vim.lsp.Config
return {
	cmd = { "pyright-langserver", "--stdio" },
	filetypes = { "python" },
	root_markers = {
		"Pipfile",
		"pyproject.toml",
		"requirements.txt",
		"setup.cfg",
		"setup.py",
		".git",
	},
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "workspace",
				useLibraryCodeForTypes = true,
				typeCheckingMode = "basic",
				autoImportCompletions = true,
			},
		},
	},
}
