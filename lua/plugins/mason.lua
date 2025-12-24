return {
	"mason-org/mason.nvim",
	dependencies = {
		"b0o/schemastore.nvim",
	},
	opts = {},
	config = function()
		require("mason").setup()

		local ensure_installed = {
			"bash-language-server",
			"black",
			"docker-compose-language-service",
			"dockerfile-language-server",
			"eslint-lsp",
			"goimports",
			"golangci-lint-langserver",
			"gopls",
			"json-lsp",
			"lua-language-server",
			"prettier",
			"pyright",
			"shfmt",
			"shopify-cli",
			"stylua",
			"taplo",
			"typescript-language-server",
			"vue-language-server",
			"yaml-language-server",
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
