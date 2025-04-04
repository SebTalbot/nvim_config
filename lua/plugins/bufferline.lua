return {
	"akinsho/bufferline.nvim",
	lazy = false,
	opts = {
		--- @type bufferline.Options
		options = {
			always_show_bufferline = false,
			auto_toggle_bufferline = true,
			max_prefix_length = 6,
			mode = "buffers",
			separator_style = "thin",
			sort_by = "insert_at_end",
			themable = true,
			truncate_names = false,
		},
	},
}
