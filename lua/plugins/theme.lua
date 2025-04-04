return {
	"SebTalbot/everforest-nvim",
	lazy = false,
	priority = 51,
	config = function()
		require("everforest").setup()
		vim.cmd([[colorscheme everforest]])

		vim.cmd([[hi ColorColumn  guibg=none]])
		vim.cmd([[hi DiagnosticUnderlineError guifg=none]])
		vim.cmd([[hi IncSearch gui=bold guibg=#7fbbb3]])
		vim.cmd([[hi Search gui=bold guibg=#a7c080]])
		vim.cmd([[hi Visual  guibg=#384B55]])

		vim.cmd([[hi @character guifg=#D699B6]])
		vim.cmd([[hi @string.escape guifg=#E69875]])
	end,
}
