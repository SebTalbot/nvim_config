return {
	"mason-org/mason.nvim",
	opts = {},
	config = function()
		require("mason").setup()

		local ensure_installed = {
			"eslint-lsp",
			"goimports",
			"golangci-lint-langserver",
			"gopls",
			"lua-language-server",
			"prettier",
			"shopify-cli",
			"stylua",
			"typescript-language-server",
			"vue-language-server",
		}

		local registry = require("mason-registry")
		registry.refresh(function()
			for _, tool in ipairs(ensure_installed) do
				local package = registry.get_package(tool)

				if not package:is_installed() then
					vim.notify(
						string.format("Installing %s...", tool),
						vim.log.levels.INFO
					)
					package:install()
				end
			end
		end)
	end,
}
