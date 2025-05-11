local M = {}

--- Helper function for mappings
--- @param mode "n"|"v"|"i"|"t"
--- @param key string The key combination to map
--- @param command string|function The command or function to execute
--- @param desc string Description of the action
--- @param opts? vim.keymap.set.Opts Optional table with additional options
local function m(mode, key, command, desc, opts)
	if not opts then
		opts = {}
	end
	local o = vim.tbl_deep_extend("force", { desc = desc }, opts)
	vim.keymap.set(mode, key, command, o)
end

--- Helper function for normal mode mappings
--- @param key string The key combination to map
--- @param command string|function The command or function to execute
--- @param desc string Description of the action
--- @param opts? vim.keymap.set.Opts Optional table with additional options
M.NormalMap = function(key, command, desc, opts)
	m("n", key, command, desc, opts)
end

--- Helper function for visual mode mappings
--- @param key string The key combination to map
--- @param command string|function The command or function to execute
--- @param desc string Description of the action
--- @param opts? vim.keymap.set.Opts Optional table with additional options
M.VisualMap = function(key, command, desc, opts)
	m("v", key, command, desc, opts)
end

--- Helper function for insert mode mappings
--- @param key string The key combination to map
--- @param command string|function The command or function to execute
--- @param desc string Description of the action
--- @param opts? vim.keymap.set.Opts Optional table with additional options
M.InsertMap = function(key, command, desc, opts)
	m("i", key, command, desc, opts)
end

--- Helper function for terminal mode mappings
--- @param key string The key combination to map
--- @param command string|function The command or function to execute
--- @param desc string Description of the action
--- @param opts? vim.keymap.set.Opts Optional table with additional options
M.TerminalMap = function(key, command, desc, opts)
	m("t", key, command, desc, opts)
end

--- @param command string The command to execute
--- @return string
M.CommandString = function(command)
	return "<cmd>" .. command .. "<CR>"
end

--- @param func function The command to execute
--- @param params any The command to execute
--- @return function
M.Function = function(func, params)
	return function()
		func(params)
	end
end

return M
