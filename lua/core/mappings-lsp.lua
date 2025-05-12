local M = {}

local ignoreTests = {
	"%/test%/",
	"%/tests%/",
	"%.test%.", -- node
	"%.tests%.", -- node
	"_test.go$", -- go
}

M.Definitions = function()
	local builtin = require("telescope.builtin")
	builtin.lsp_definitions({
		prompt_title = "LSP Definitions",
		file_ignore_patterns = ignoreTests,
	})
end

M.Implementations = function()
	local builtin = require("telescope.builtin")
	builtin.lsp_implementations({
		prompt_title = "LSP Implementations",
		file_ignore_patterns = ignoreTests,
	})
end

M.References = function()
	local builtin = require("telescope.builtin")
	builtin.lsp_references({
		prompt_title = "LSP References",
		file_ignore_patterns = ignoreTests,
	})
end

M.TypeDefinitions = function()
	local builtin = require("telescope.builtin")
	builtin.lsp_type_definitions({
		prompt_title = "LSP Type Definitions",
		file_ignore_patterns = ignoreTests,
	})
end

return M
