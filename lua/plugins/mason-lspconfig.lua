return {
	"mason-org/mason-lspconfig.nvim",
	opts = {
		ensure_installed = {
			"bashls",
			"cssls",
			"dockerls",
			"emmet_ls",
			"eslint",
			"gopls",
			"golangci_lint_ls",
			"graphql",
			"html",
			"jsonls",
			"lua_ls",
			"shopify_theme_ls",
			"pyright",
			"taplo",
			"ts_ls",
			"vimls",
			"yamlls",
			-- "vue-language-server", -- warning not supported anymore
			"theme_check",
		},
		automatic_enable = false,
	},
}
