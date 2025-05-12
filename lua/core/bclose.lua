--- Based on https://vim.fandom.com/wiki/Deleting_a_buffer_without_closing_the_window

local function warn(msg)
	vim.api.nvim_echo({ { "Bclose: " .. msg, "WarningMsg" } }, true, {})
end

local function bclose(bang, buffer)
	local btarget

	if buffer == "" then
		btarget = vim.fn.bufnr("%")
	elseif string.match(buffer, "^%d+$") then
		btarget = vim.fn.bufnr(tonumber(buffer))
	else
		btarget = vim.fn.bufnr(buffer)
	end

	if btarget < 0 then
		warn("No matching buffer for " .. buffer)
		return
	end

	if bang == "" and vim.fn.getbufvar(btarget, "&modified") == 1 then
		warn(
			"No write since last change for buffer "
			.. btarget
			.. " (use :Bclose!)"
		)
		return
	end

	local wnums = {}
	for i = 1, vim.fn.winnr("$") do
		if vim.fn.winbufnr(i) == btarget then
			table.insert(wnums, i)
		end
	end

	local wcurrent = vim.fn.winnr()

	for _, w in ipairs(wnums) do
		vim.cmd(w .. "wincmd w")
		local prevbuf = vim.fn.bufnr("#")

		if prevbuf > 0 and vim.fn.buflisted(prevbuf) == 1 and prevbuf ~= w then
			vim.cmd("buffer #")
		else
			vim.cmd("bprevious")
		end

		if btarget == vim.fn.bufnr("%") then
			local blisted = {}
			for i = 1, vim.fn.bufnr("$") do
				if vim.fn.buflisted(i) == 1 and i ~= btarget then
					table.insert(blisted, i)
				end
			end

			local bhidden = {}
			for _, buf in ipairs(blisted) do
				if vim.fn.bufwinnr(buf) < 0 then
					table.insert(bhidden, buf)
				end
			end

			local bjump = -1
			if #bhidden > 0 then
				bjump = bhidden[1]
			elseif #blisted > 0 then
				bjump = blisted[1]
			end

			if bjump > 0 then
				vim.cmd("buffer " .. bjump)
			else
				vim.cmd("enew" .. bang)
			end
		end
	end

	vim.cmd("bdelete" .. bang .. " " .. btarget)
	vim.cmd(wcurrent .. "wincmd w")
end

vim.api.nvim_create_user_command("Bclose", function(opts)
	bclose(opts.bang and "!" or "", opts.args)
end, {
	nargs = "?",
	bang = true,
	complete = "buffer",
})

