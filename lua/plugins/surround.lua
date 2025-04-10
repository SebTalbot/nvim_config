return {
	"kylechui/nvim-surround",
	event = "VeryLazy",
	config = function() -- Needed, not auto
		require("nvim-surround").setup({})
	end,
}
