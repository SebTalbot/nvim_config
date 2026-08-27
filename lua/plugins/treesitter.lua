return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local ensure_installed = {
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
		}
		require("nvim-treesitter").install(ensure_installed)

		vim.treesitter.language.register("tsx", "typescriptreact")
		vim.treesitter.language.register("bash", "zsh")

		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("treesitter", {}),
			callback = function(args)
				local language = vim.treesitter.language.get_lang(args.match)
				if
					not language or not vim.treesitter.language.add(language)
				then
					return
				end

				vim.treesitter.start(args.buf, language)

				vim.bo[args.buf].indentexpr =
					"v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
