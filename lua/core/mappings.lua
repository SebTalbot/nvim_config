local map = require("core.utils").map

vim.g.mapleader = " "
local M = {}

M.keybinds = {
  general = {
    general = {
      quick_help = "<leader>h",
      hide_highlights = "<leader>/",
      move_line_down = "<C-j>",
      move_line_up = "<C-k>",
    },
    buffers = {
      close_current = "<leader>bdd",
      close_all_but_current = "<leader>bda",
      close_list = "<leader>bdl",
      last = "<leader>bb",
      next = "<leader>bn",
      previous = "<leader>bp",
    },
    windows = {
      close_current = "<leader>wd",
      move_down = "<leader>wJ",
      move_up = "<leader>wK",
      move_left = "<leader>wL",
      move_right = "<leader>wH",
      move_to_down = "<leader>wj",
      move_to_up = "<leader>wk",
      move_to_left = "<leader>wl",
      move_to_right = "<leader>wh",
      split_horizontal = "<leader>ws",
      split_vertical = "<leader>wv",
    },
  },
  plugins = {
    telescope = {
        buffers = "<leader>fb",
        find_files = "<leader>ff",
        find_hiddenfiles = "<leader>fa",
        git_commits = "",
        git_status = "",
        help_tags = "",
        live_grep = "<leader>fw",
        oldfiles = "",
        themes = "",
    }
  },
  files = {
    i3wm = "<leader>zi",
    vim_init = "<leader>zv",
    vim_mappings = "<leader>zm",
    zsh = "<leader>zb",
  }
}

-------------------------------------------------------------------------------
-- General
local generalMappings = M.keybinds.general

M.disable = function ()
  map("n", "Q", "<nop>")
  map("n", "<C-z>", "<nop>")
  map("v", "u", "gv")
end

M.overwrite = function ()
  map("n", "<leader>*", "*``")
  map("v", "<", "<gv")
  map("v", ">", ">gv")
end

M.general = function ()
   local m = generalMappings.general
  map("n", m.quick_help, ":vert h<space>")
  map("n", m.hide_highlights, ":nohlsearch<CR>")
  map("n", m.move_line_down, "ddp")
  map("n", m.move_line_up, "ddkP")
  map("v", m.move_line_down, "dp`[V`]")
  map("v", m.move_line_up, "dkP`[V`]")
end

M.buffers = function ()
   local m = generalMappings.buffers
  map("n", m.close_current, ":Bclose!")
  -- map("n", m.close_all_but_current, "")
  -- map("n", m.close_list, "")
  map("n", m.last, ":e#<CR>")
  map("n", m.next, ":bn<CR>")
  map("n", m.previous, ":bp<CR>")
end

M.windows = function ()
   local m = generalMappings.windows
  map("n", m.close_current, "<C-w>q")
  map("n", m.move_down, "<C-w><S-j>")
  map("n", m.move_up, "<C-w><S-k>")
  map("n", m.move_left, "<C-w><S-l>")
  map("n", m.move_right, "<C-w><S-h>")
  map("n", m.move_to_down, "<C-w><C-j>")
  map("n", m.move_to_up, "<C-w><C-k")
  map("n", m.move_to_left, "<C-w><C-l>")
  map("n", m.move_to_right, "<C-w><C-h>")
  map("n", m.split_horizontal, "<C-w>s")
  map("n", m.split_vertical, "<C-w>v")
end

-------------------------------------------------------------------------------
-- Plugins
local pluginsMappings = M.keybinds.plugins

M.telescope = function()
   local m = pluginsMappings.telescope
   map("n", m.buffers, ":Telescope buffers <CR>")
   map("n", m.find_files, ":Telescope find_files <CR>")
   map("n", m.find_hiddenfiles, ":Telescope find_files follow=true no_ignore=true hidden=true <CR>")
   -- map("n", m.git_commits, ":Telescope git_commits <CR>")
   -- map("n", m.git_status, ":Telescope git_status <CR>")
   -- map("n", m.help_tags, ":Telescope help_tags <CR>")
   -- map("n", m.live_grep, ":Telescope live_grep <CR>")
   -- map("n", m.oldfiles, ":Telescope oldfiles <CR>")
   -- map("n", m.themes, ":Telescope themes <CR>")
end

-------------------------------------------------------------------------------
-- Files

M.files = function ()
  local m = M.keybinds.files
  map("n", m.i3wm, ":e ~/.config/i3/config<CR>G")
  map("n", m.vim_init, ":e ~/.config/nvim/init.lua<CR>G")
  map("n", m.vim_mappings, ":e ~/.config/nvim/lua/core/mappings.lua<CR>G")
  map("n", m.zsh, ":e ~/.zshrc<CR>G")
end

-------------------------------------------------------------------------------
-- Init

M.generateCommands = function()
  local cmd = vim.cmd
  -- Packer
  cmd "silent! command PackerClean lua require 'plugins' require('packer').clean()"
  cmd "silent! command PackerCompile lua require 'plugins' require('packer').compile()"
  cmd "silent! command PackerInstall lua require 'plugins' require('packer').install()"
  cmd "silent! command PackerStatus lua require 'plugins' require('packer').status()"
  cmd "silent! command PackerSync lua require 'plugins' require('packer').sync()"
  cmd "silent! command PackerUpdate lua require 'plugins' require('packer').update()"
end

M.init = function()
  M.disable()
  M.overwrite()
  M.general()
  M.buffers()
  M.windows()
  M.telescope()
  M.files()
  M.generateCommands()
end

return M
