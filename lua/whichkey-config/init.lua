local wk = require("which-key")
local mappings = {
  q = {":q<cr>", "Quit"},
  Q = {":wq<cr>", "Save & Quit"},
  w = {":w<cr>", "Save"},
  x = {":bdelete<cr>", "Close"},
  E = {":e $MYVIMRC<cr>", "Edit config"},
  F = {":Telescope find_files<cr>", "Telescope Find Files"},
  R = {":Telescope live_grep<cr>", "Telescope Live Grep"},
  s = {":source $MYVIMRC<cr>", "Source VIMRC"},

}
local opts = {prefix = '<leader>'}
wk.register(mappings, opts)
