local cmd = vim.cmd

cmd([[
	autocmd BufEnter * if &filetype == "" | setlocal ft=config | endif
	autocmd BufEnter * if &filetype == "conf" | setlocal ft=config | endif
	autocmd BufEnter * if &filetype == "text" | setlocal ft=config | endif
]])
