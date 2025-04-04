return {
	"akinsho/bufferline.nvim",
	opts = {
		--- @type bufferline.Options
		options = {
			always_show_bufferline = false,
			auto_toggle_bufferline = true,
			buffer_close_icon = "",
			close_icon = "",
			diagnostics = false,
			indicator = { icon = "", style = "icon" },
			left_trunc_marker = "",
			max_prefix_length = 6,
			mode = "buffers",
			numbers = "none",
			offsets = { { separator = false } },
			right_trunc_marker = "",
			separator_style = "thin",
			show_buffer_close_icons = false,
			show_buffer_icons = false,
			show_duplicate_prefix = true,
			show_tab_indicators = false,
			sort_by = "insert_at_end",
			themable = true,
			truncate_names = false,
		},
	},
}
