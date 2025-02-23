vim.api.nvim_create_autocmd("FileType", {
	desc = "LSP lua-language-server",
	pattern = { "lua" },
	callback = function(ev)
		vim.lsp.start({
			name = "lua-language-server",
			cmd = { "lua-language-server" },
			root_dir = vim.fs.root(
				ev.buf,
				{ "lua/", ".luarc.json", "stylua.toml", ".git" }
			),
		})
	end,
})
