require('plugins')
require('keybindings')
require('options')
require('nvim-tree-config')
require('lualine-config')
require('bufferline-config')
require('treesitter-config')
require('autopairs-config')
require('whichkey-config')
require('telescope-config')
require('colorizer-config')
require('dashboard-config')
require('terminal-config')
require('lsp')
require('plugins/material')
vim.g.material_style = 'deep ocean'
vim.cmd('colorscheme material')
