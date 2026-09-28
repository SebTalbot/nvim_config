return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").install({
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
			"markdown_inline",
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
		})

		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("treesitter_start", { clear = true }),
			callback = function(args)
				if pcall(vim.treesitter.start, args.buf) then
					vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end
			end,
		})
	end,
}
