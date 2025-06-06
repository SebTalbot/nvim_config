local map = require("core.mappings-utils")
local n = map.NormalMap
local v = map.VisualMap
local i = map.InsertMap
local t = map.TerminalMap
local c = map.CommandString
local f = map.Function

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

n("q:", "<nop>", "Disabled")
n("Q", "<nop>", "Disabled")
n("Q:", "<nop>", "Disabled")
n("<C-z>", "<nop>", "Disabled")

-- General mappings --
v(">", ">gv", "Keep selection after indent")
v("<", "<gv", "Keep selection after indent")

n("<C-j>", ":m .+1<CR>==", "Move line down")
n("<C-k>", ":m .-2<CR>==", "Move line up")
v("<C-j>", ":m '>+1<CR>gv=gv", "Move line down")
v("<C-k>", ":m '<-2<CR>gv=gv", "Move line up")
n("<C-s>", c("write!"), "Save file")
i("<C-s>", c("write!"), "Save file")
t("<C-space>", "<C-\\><C-n>", "Normal mode")

n("<C-u>", "<C-u>zz", "Half page up and center")
n("<C-d>", "<C-d>zz", "Half page down and center")

local function next_fold()
	vim.cmd("normal! ]z")
	vim.cmd("normal! zj")
end
n("zn", next_fold, "Next fold same level")

local function previous_fold()
	vim.cmd("normal! zk")
	vim.cmd("normal! 9[z")
end
n("zp", previous_fold, "Previous fold same level")

n("<leader>", "", "Custom Keys")
n("<leader><leader>", c("WhichKey"), "Normal Keys")
n("<leader>*", "*``", "Match word")
n("<leader>/", c("nohlsearch"), "Remove match highlight")

local column = require("core.column")
n("<leader>c", column.ToggleHighlight, "Toggle 80 column")

n("<leader>q", "", "General")
n("<leader>qq", c("qa!"), "Force Quit")
n("<leader>qw", c("w"), "Save")
n("<leader>qa", c("wa"), "Save all")

n("<leader>y", "", "Yank")
n("<leader>yf", c("let @+ = expand('%:r')"), "Current path")
n("<leader>yy", c("let @+ = expand('%:t:r')"), "File name")

-- Buffers --
n("<leader>b", "", "Buffers")
n("<leader>bb", c("e#"), "Previous buffer")
n("<leader>bn", c("BufferLineCycleNext"), "Cycle Next")
n("<leader>bp", c("BufferLineCyclePrev"), "Cycle Prev")
n("<leader>bl", c("BufferLineMoveNext"), "Move Right")
n("<leader>bh", c("BufferLineMovePrev"), "Move Left")
n("<leader>bs", c("BufferLineSortByRelativeDirectory"), "Sort")

n("<leader>bd", "", "Close")
n("<leader>bdd", c("Bclose!"), "Current")
n("<leader>bdo", c("BufferLineCloseOthers"), "Others")

-- Windows --
local windows = require("core.window-utils")
n("<leader>w", "", "Windows")
n("<leader>wd", "<C-w>q", "Close")
n("<leader>wJ", "<C-w><S-j>", "Move down")
n("<leader>wK", "<C-w><S-k>", "Move up")
n("<leader>wL", "<C-w><S-l>", "Move right")
n("<leader>wH", "<C-w><S-h>", "Move left")
n("<leader>wj", "<C-w><C-j>", "Select down")
n("<leader>wk", "<C-w><C-k>", "Select up")
n("<leader>wl", "<C-w><C-l>", "Select right")
n("<leader>wh", "<C-w><C-h>", "Select left")
n("<leader>ws", "<C-w>s", "Split Horizontally")
n("<leader>wv", "<C-w>v", "Split Vertically")

n("<leader>wr", "", "Resize")
n("<leader>wre", "<C-w>=", "Equal")
n("<leader>wrr", windows.resizeMax, "Max Line")
n("<leader>wrj", "<cmd>resize +5<CR>", "Taller")
n("<leader>wrk", "<cmd>resize -5<CR>", "Shorter")
n("<leader>wrl", "<cmd>vertical resize +5<CR>", "Wider")
n("<leader>wrh", "<cmd>vertical resize -5<CR>", "Narrower")

-- Files Manager --
n("<leader>n", "", "Files Manager")
n("<leader>nn", c("Yazi"), "Current File")
n("<leader>np", c("Yazi cwd"), "Project Root")
n("<leader>nt", c("Yazi toggle"), "Toggle last session")

-- Applications --
n("<leader>a", "", "Applications")
n("<leader>ah", c("checkhealth"), "Check health")
n("<leader>al", c("Lazy"), "Lazy (plugin manager)")
n("<leader>au", c("lua require('undotree').toggle()"), "Undotree")
n("<leader>am", c("Mason"), "Mason (LSP package manager)")
n("<leader>at", c("TabnineChat"), "Tabnine Chat")

-- Files
n("<leader>z", "", "Open System File")
n("<leader>zi", c("e ~/.config/i3/config"), "I3WM")
n("<leader>zp", c("e ~/.config/polybar/config"), "Polybar")
n("<leader>zr", c("e ~/.config/rofi/config.rasi"), "Rofi")
n("<leader>zt", c("e ~/.config/kitty/kitty.conf"), "Kitty")
n("<leader>zz", c("e ~/.zshrc"), "ZSH")

-- Search
local Search = require("core.mappings-search")
n("<leader>s", "", "Search")
n("<leader>sb", c("Telescope buffers"), "Buffers")
n("<leader>sh", c("Telescope help_tags"), "Help")
n("<leader>sr", c("Telescope resume"), "Resume last search")
n("<leader>sf", Search.Files, "Files")
n("<leader>sg", Search.LiveGrep, "Ripgrep (faster)")
n("<leader>sw", Search.GrepString, "Fuzzy (slower)")
n("<leader>st", "", "Tests")
n("<leader>stf", Search.TestsFiles, "Files")
n("<leader>stg", Search.TestsLiveGrep, "Ripgrep (faster)")
n("<leader>stw", Search.TestsGrepString, "Fuzzy (slower)")
n("<leader>sa", "", "All")
n("<leader>saf", c("Telescope find_files"), "Files")
n("<leader>sag", c("Telescope live_grep"), "Ripgrep (faster)")
n("<leader>saw", c("Telescope grep_string"), "Fuzzy (slower)")

-- Git
n("<leader>g", "", "Git")
n("<leader>ge", c("LazyGit"), "LazyGit")
n("<leader>gb", c("Telescope git_branches"), "Branches")
n("<leader>gc", c("Telescope git_bcommits"), "Buffer Commits")
n("<leader>gC", c("Telescope git_commits"), "Project Commits")
n("<leader>gs", c("Telescope git_status"), "Status")
n("<leader>gS", c("Telescope git_stash"), "Stash")
n("<leader>gd", c("Gitsigns toggle_deleted"), "Toggle Deleted")
n("<leader>gh", c("Gitsigns toggle_linehl"), "Toggle Highlight")
n("<leader>gl", c("Gitsigns blame_line"), "Line Blame")
n("<leader>gL", c("Gitsigns blame"), "File Blame")
n("<leader>gg", c("Gitsigns preview_hunk"), "Hunk Preview")
n("<leader>gn", c("Gitsigns next_hunk"), "Hunk Next")
n("<leader>gp", c("Gitsigns prev_hunk"), "Hunk Previous")
n("<leader>gv", c("Gitsigns select_hunk"), "Hunk Select")
n("<leader>ga", "", "Actions")
n("<leader>gar", c("Gitsigns reset_hunk"), "Hunk Reset")
n("<leader>gaR", c("Gitsigns reset_buffer"), "Buffer Reset")
n("<leader>gas", c("Gitsigns stage_hunk"), "Hunk Stage")
n("<leader>gaS", c("Gitsigns stage_buffer"), "Buffer Stage")

-- Lsp
local Lsp = require("core.mappings-lsp")
n("S-k", vim.lsp.buf.hover, "LSP Hover")
n("<leader>l", "", "LSP")
n("<leader>ll", vim.lsp.buf.format, "Format")
n("<leader>lc", vim.lsp.buf.rename, "Rename")

n("<leader>ld", Lsp.Definitions, "Definitions")
n("<leader>li", Lsp.Implementations, "Implementations")
n("<leader>lr", Lsp.References, "References")
n("<leader>lt", Lsp.TypeDefinitions, "Type Definitions")

n("<leader>la", "", "All")
n("<leader>lad", c("Telescope lsp_definitions"), "Definitions")
n("<leader>lai", c("Telescope lsp_implementations"), "Implementations")
n("<leader>lar", c("Telescope lsp_references"), "References")
n("<leader>lat", c("Telescope lsp_type_definitions"), "Type Definitions")

-- Diagnostic
n("<leader>e", "", "Diagnostic")
n("<leader>ee", vim.diagnostic.open_float, "Details")
n(
	"<leader>ep",
	f(vim.diagnostic.jump, { count = -1, float = true }),
	"Previous"
)
n(
	"<leader>eP",
	f(
		vim.diagnostic.jump,
		{ count = -1, float = true, severity = vim.diagnostic.severity.ERROR }
	),
	"Previous Error"
)
n("<leader>en", f(vim.diagnostic.jump, { count = 1, float = true }), "Next")
n(
	"<leader>eN",
	f(
		vim.diagnostic.jump,
		{ count = 1, float = true, severity = vim.diagnostic.severity.ERROR }
	),
	"Next Error"
)
n("<leader>el", vim.diagnostic.setloclist, "Fix list")
