return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

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
		})
	end,
}
