local function line_count()
	return tostring(vim.api.nvim_buf_line_count(0))
end

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			theme = "auto",
		},
		sections = {
			lualine_c = {
				{
					"filename",
					path = 1,
				},
			},
			lualine_x = {
				"lsp_progress",
			},
			lualine_y = {
				line_count,
				"progress",
			},
			lualine_z = {
				"location",
			},
		},
	},
}
