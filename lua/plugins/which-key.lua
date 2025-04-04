return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	---@type wk.Win.opts
	opts = {
		focusable = false,
		noautocmd = true,
		relative = "editor",
		style = "minimal",
		mouse = false,
		icons = {
			mappings = false,
		},
	},
}
