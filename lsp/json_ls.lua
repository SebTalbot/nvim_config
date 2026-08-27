---@type vim.lsp.Config
return {
	cmd = { "vscode-json-language-server", "--stdio" },
	filetypes = { "json", "jsonc" },
	root_markers = { ".git" },
	init_options = {
		provideFormatter = true,
	},
	settings = {
		json = {
			-- schemas = require("schemastore").json.schemas(),
			validate = { enable = true },
		},
	},
	before_init = function(_, config)
		-- can't assign new table because of
		-- https://github.com/neovim/neovim/issues/27740#issuecomment-1978629315
		config.settings.json.schemas = require("schemastore").json.schemas()
	end,
}
