vim.api.nvim_create_autocmd("VimResized", {
	group = vim.api.nvim_create_augroup("WindowAutoResize", { clear = true }),
	pattern = "*",
	callback = function()
		vim.cmd("wincmd =")
	end,
	desc = "Auto-resize windows when terminal is resized",
})

local function calculateLineLength(line, tabstop)
	local length = 0
	local pos = 1

	while pos <= #line do
		local tab_pos = line:find("\t", pos)
		if not tab_pos then
			length = length + (#line - pos + 1)
			break
		else
			length = length + (tab_pos - pos)
			length = length + (tabstop - (length % tabstop))
			pos = tab_pos + 1
		end
	end

	return length
end

local resizeMax = function()
	local max_length = 0
	local top_line = vim.fn.line("w0")
	local bottom_line = vim.fn.line("w$")
	local lines =
		vim.api.nvim_buf_get_lines(0, top_line - 1, bottom_line, false)

	local tabstop = vim.bo.tabstop

	for _, line in ipairs(lines) do
		print(line)
		local line_length = calculateLineLength(line, tabstop)

		if line_length > max_length then
			max_length = line_length
		end
	end

	local number_width = vim.wo.numberwidth or 4
	local sign_column = vim.wo.signcolumn
	local fold_column = vim.wo.foldcolumn

	local margin = number_width
	if sign_column ~= "no" then
		margin = margin + 2
	end
	if fold_column ~= "0" then
		margin = margin + tonumber(fold_column)
	end

	max_length = max_length + margin

	max_length = math.max(max_length, 40)

	vim.cmd("wincmd =")
	vim.api.nvim_win_set_width(0, max_length)
end

return {
	resizeMax = resizeMax,
}
