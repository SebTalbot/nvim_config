return {
	"stevearc/conform.nvim",
	opts = {
		-- :help conform-formatters
		formatters_by_ft = {
			lua = { "stylua" },
			go = { "goimports" },
		},
	},
}
