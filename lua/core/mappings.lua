local map = require("core.mappings-utils")
local n = map.NormalMap
local v = map.VisualMap
local i = map.InsertMap
local t = map.TerminalMap
local c = map.CommandString

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

n("q:", "<nop>", "Disabled")
n("Q", "<nop>", "Disabled")
v("u", "<nop>", "Disabled")
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

n("<leader>", "", "Custom Keys")
n("<leader><leader>", c("WhichKey"), "Normal Keys")
n("<leader>*", "*``", "Match word")
n("<leader>/", c("nohlsearch"), "Remove match highlight")

n("<leader>y", "", "Yank")
n("<leader>yf", c("let @+ = expand('%:r')"), "Current path")
n("<leader>yy", c("let @+ = expand('%:t:r')"), "File name")

-- Buffers --
n("<leader>b", "", "Buffers")
n("<leader>bb", c("e#"), "Previous buffer")
n("<leader>bn", c("BufferLineCycleNext"), "Cycle Next")
n("<leader>bp", c("BufferLineCyclePrev"), "Cycle Prev")
n("<leader>bj", c("BufferLineMoveNext"), "Move Next")
n("<leader>bk", c("BufferLineMovePrev"), "Move prev")
n("<leader>bs", c("BufferLineSortByRelativeDirectory"), "Sort")

n("<leader>bd", "", "Close")
n("<leader>bdd", c("Bclose!"), "Current")
n("<leader>bdo", c("BufferLineCloseOthers"), "Others")

-- Windows --
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
-- n("<leader>wrr", c("call lens#run()"), "Needed")

-- Applications --
n("<leader>a", "", "Applications")
n("<leader>ah", c("checkhealth"), "Check health")
n("<leader>al", c("Lazy"), "Lazy (plugin manager)")
-- n("<leader>am", c("Mason"), "Mason (LSP package manager)")

-- Files
n("<leader>z", "", "Open System File")
n("<leader>zi", c("e ~/.config/i3/config"), "I3WM")
n("<leader>zp", c("e ~/.config/polybar/config"), "Polybar")
n("<leader>zr", c("e ~/.config/rofi/config.rasi"), "Rofi")
n("<leader>zt", c("e ~/.config/kitty/kitty.conf"), "Kitty")
n("<leader>zz", c("e ~/.zshrc"), "ZSH")
