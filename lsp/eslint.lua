---@type vim.lsp.Config
return {
	cmd = { "vscode-eslint-language-server", "--stdio" },
	filetypes = {
		"javascript",
		"javascript.jsx",
		"javascriptreact",
		"typescript",
		"typescript.tsx",
		"typescriptreact",
		"vue",
	},
	root_markers = {
		".eslintrc.js",
		"eslint.config.js",
		".git",
	},
	settings = {
		validate = "on",
		format = true,
		quiet = false,
		onIgnoredFiles = "off",
		nodePath = "",
		workingDirectory = { mode = "location" },
		problems = {
			shortenToSingleLine = true,
		},
		rulesCustomizations = {},
		codeAction = {
			disableRuleComment = {
				enable = true,
				location = "separateLine",
			},
			showDocumentation = {
				enable = true,
			},
		},
		experimental = {
			useFlatConfig = true,
		},
	},
}
