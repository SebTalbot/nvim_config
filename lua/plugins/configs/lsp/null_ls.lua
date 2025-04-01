local null_ls_present, null_ls = pcall(require, "null-ls")
if not null_ls_present then
	print("Warning: Cannot find null-ls")
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#code-actions
local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

local custom_prettier = formatting.prettier
table.insert(custom_prettier.filetypes, "liquid")

null_ls.setup({
	debug = true,
	sources = {
		formatting.black,
		formatting.goimports,
		formatting.stylua,
		custom_prettier,
	},
	on_attach = require("plugins.configs.lsp.handlers").on_attach,
})
