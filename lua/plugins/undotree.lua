return {
	"jiaoshijie/undotree",
	dependencies = "nvim-lua/plenary.nvim",
	config = true,
	opts = {
		keymaps = {
			["j"] = "move_next",
			["n"] = "move_next",
			["k"] = "move_prev",
			["p"] = "move_prev",
			["gj"] = "move2parent",
			["gn"] = "move2parent",
			["J"] = "move_change_next",
			["N"] = "move_change_next",
			["K"] = "move_change_prev",
			["P"] = "move_change_prev",
			["<cr>"] = "action_enter",
			["d"] = "enter_diffbuf",
			["q"] = "quit",
		},
	},
}
