require("plugins")
require("keybindings")
require("options")
require("comment-config")
require("nvim-tree-config")
if vim.g.nvui then
    -- Configure through vim commands
    vim.cmd [[NvuiTitlebarFontSize 13]]
    vim.cmd [[NvuiScrollAnimationDuration 0.1]]
    vim.cmd [[NvuiCursorAnimationDuration 0.1]]
    vim.cmd [[NvuiMoveAnimationDuration 0.1]]
    vim.cmd [[NvuiTitlebarFontFamily FiraCode Nerd Font Mono]]
    vim.cmd [[set guifont=FiraCode\ Nerd\ Font\ Mono:h14]]
end
