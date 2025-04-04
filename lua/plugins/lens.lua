--- @deprecated Should remove and find another window resizer
return {
	"SebTalbot/lens.vim",
	config = function()
		vim.cmd([[let g:lens#disabled = 1]])
	end,
}
