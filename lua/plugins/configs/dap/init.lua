local dap_present, _ = pcall(require, "dap")
if not dap_present then
	print("Warning: Cannot find nvim-dap")
	return false
end

local mason_dap_present, mason_dap = pcall(require, "mason-nvim-dap")
if not mason_dap_present then
	print("Warning: Cannot find mason-nvim-dap")
	return false
end

require("core.mappings").dap()
require("plugins.configs.dap.go")

vim.fn.sign_define("DapBreakpoint", { text = " ", texthl = "red", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = " ", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = " ", texthl = "", linehl = "", numhl = "" })

mason_dap.setup({
	ensure_installed = {},
	automatic_installation = true,
})
