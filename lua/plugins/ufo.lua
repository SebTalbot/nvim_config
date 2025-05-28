return {
	"kevinhwang91/nvim-ufo",
	dependencies = {
		"kevinhwang91/promise-async",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		provider_selector = function()
			return { "treesitter", "indent" }
		end,
	},
}
