local options = {
  clipboard = "unnamedplus",
  colorcolumn = "80",
  conceallevel = 0,
  cursorline = true,
  expandtab = true,
  ignorecase = true,
  lazyredraw = true,
  linebreak = true,
  mouse = "",
  number = true,
  relativenumber = true,
  shiftwidth = 2,
  showmatch = true,
  smartcase = true,
  swapfile = false,
  tabstop = 2,
  termguicolors = true,
  timeout = false,
  undodir = "~/.config/nvim/undo",
  undofile = true,
}

for key, value in pairs(options) do
  vim.opt[key] = value
end
