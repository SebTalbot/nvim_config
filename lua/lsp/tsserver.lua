--- @deprecated

return {
	init_options = {
		plugins = {
			{
				name = "@vue/typescript-plugin",
				location = vim.fn.stdpath("data")
					.. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
				languages = { "vue" },
			},
		},
		preferences = {
			allowRenameOfImportPath = true,
			importModuleSpecifierEnding = "auto",
			-- importModuleSpecifierPreference = "non-relative",
			includeCompletionsForImportStatements = true,
			includeCompletionsForModuleExports = true,
			-- quotePreference = "single",
		},
	},
	filetypes = {
		"typescript",
		"javascript",
		"javascriptreact",
		"typescriptreact",
		"vue",
	},
}
