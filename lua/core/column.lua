local M = {}
local _is_column_toggled = false

function M.ToggleHighlight()
	if _is_column_toggled then
		vim.cmd([[hi ColorColumn  guibg=none]])
		_is_column_toggled = false
	else
		vim.cmd([[hi ColorColumn  guibg=#475258]])
		_is_column_toggled = true
	end
end

return M
