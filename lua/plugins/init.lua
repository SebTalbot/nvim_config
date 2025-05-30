local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		lazyrepo,
		lazypath,
	})
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	require("plugins.autopairs"),
	require("plugins.bufferline"),
	require("plugins.cmp"),
	require("plugins.colorizer"),
	require("plugins.gitsigns"),
	require("plugins.indent-blankline"),
	require("plugins.lazygit"),
	require("plugins.lspconfig"), --- @deprecated move to native
	require("plugins.lualine"),
	require("plugins.mason"),
	require("plugins.mason-lspconfig"),
	require("plugins.null-ls"), --- @deprecated move to native
	require("plugins.surround"),
	require("plugins.tabnine"),
	require("plugins.telescope"),
	require("plugins.theme"),
	require("plugins.treesitter"),
	require("plugins.treesitter-commentstring"),
	require("plugins.treesitter-context"),
	require("plugins.undotree"),
	require("plugins.which-key"),
	require("plugins.yazi"),
	"andymass/vim-matchup",
})
