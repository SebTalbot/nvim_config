vim.lsp.enable({
	"bash_ls",
	"docker_compose_ls",
	"docker_ls",
	"eslint",
	"golangci_lint_ls",
	"gopls",
	"json_ls",
	"lua_ls",
	"pyright",
	"shopify",
	"toml_ls",
	"ts_ls",
	"yaml_ls",
})

vim.diagnostic.config({
	virtual_text = false,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.HINT] = "",
			[vim.diagnostic.severity.INFO] = "",
		},
	},
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = true,
		header = "",
		prefix = "",
	},
})
