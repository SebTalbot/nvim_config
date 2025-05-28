return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local opts = {
			ensure_installed = {
				"bash",
				"css",
				"dockerfile",
				"gitignore",
				"go",
				"gomod",
				"gosum",
				"graphql",
				"html",
				"javascript",
				"json",
				"liquid",
				"lua",
				"markdown",
				"printf",
				"python",
				"regex",
				"scss",
				"sql",
				"toml",
				"tsx",
				"typescript",
				"vim",
				"vue",
				"yaml",
			},
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = {
				enable = true,
			},
			fold = {
				enable = true,
			},
			autopairs = {
				enable = true,
			},
		}
		require("nvim-treesitter.configs").setup(opts)
	end,
}
