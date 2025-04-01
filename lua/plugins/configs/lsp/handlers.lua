local M = {}

M.setup = function()
	local config = {
		virtual_text = false,
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = "",
				[vim.diagnostic.severity.WARN] = "",
				[vim.diagnostic.severity.HINT] = "",
				[vim.diagnostic.severity.INFO] = "",
			}
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}
	vim.diagnostic.config(config)
end

local capabilities = function()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
	if not status_ok then
		return capabilities
	end
	return vim.tbl_deep_extend("force", capabilities, cmp_nvim_lsp.default_capabilities())
end

local on_attach = function(client, bufnr)
	require("core.mappings").lsp(bufnr)
end

M.on_attach = on_attach

M.inject = function(settings)
	local default = {
		capabilities = capabilities(),
		on_attach = on_attach,
	}
	return vim.tbl_deep_extend("force", default, settings)
end

return M
