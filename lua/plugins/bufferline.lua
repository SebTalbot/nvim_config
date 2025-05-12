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
			show_buffer_close_icons = false,
			show_buffer_icons = false,
			sort_by = "insert_at_end",
			themable = true,
			truncate_names = false,
		},
	},
}
