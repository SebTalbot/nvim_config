return {
	"neovim/nvim-lspconfig",
	version = "2.4.0", --- @deprecated migrate configs
	config = function()
		local lspconfig = require("lspconfig")

		lspconfig.bashls.setup({})
		lspconfig.cssls.setup({})
		lspconfig.dockerls.setup({})
		lspconfig.emmet_ls.setup({})
		lspconfig.eslint.setup({})
		lspconfig.gopls.setup({
			settings = {
				gopls = {
					buildFlags = { "-tags=integration,unit" },
					gofumpt = true,
				},
			},
		})
		lspconfig.golangci_lint_ls.setup({})
		lspconfig.graphql.setup({})
		lspconfig.html.setup({})
		lspconfig.jsonls.setup(require("lsp.json"))
		lspconfig.lua_ls.setup({})
		lspconfig.shopify_theme_ls.setup({})
		lspconfig.pyright.setup({})
		lspconfig.taplo.setup({})
		lspconfig.ts_ls.setup(require("lsp.tsserver"))
		lspconfig.vimls.setup({})
		lspconfig.yamlls.setup({})

		-- lspconfig.volar.setup({
		-- 	init_options = {
		-- 		vue = {
		-- 			hybridMode = false,
		-- 			maxOldSpaceSize = 8096,
		-- 		},
		-- 	},
		-- })

		lspconfig.theme_check.setup({
			root_dir = function(fname)
				return vim.loop.cwd()
			end,
		})

		require("lsp.diagnostic").setup()
	end,
}
