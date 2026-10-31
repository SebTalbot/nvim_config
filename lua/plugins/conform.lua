return {
	"stevearc/conform.nvim",
	opts = {
		-- :help conform-formatters
		formatters_by_ft = {
			lua = { "stylua" },
			c = { "clang-format" },
			cpp = { "clang-format" },
			go = { "goimports", "gofumpt" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			vue = { "prettier" },
			python = { "black" },
			sh = { "shfmt" },
			zsh = { "shfmt" },
		},
	},
}
