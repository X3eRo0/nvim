require("plugins")
require("keybindings")
require("options")
require("comment-config")
-- require("nvim-tree-config")
require("netrw-config")
if vim.g.nvui then
    -- Configure through vim commands
    vim.cmd [[NvuiTitlebarFontSize 13]]
    vim.cmd [[NvuiScrollAnimationDuration 0.1]]
    vim.cmd [[NvuiCursorAnimationDuration 0.1]]
    vim.cmd [[NvuiMoveAnimationDuration 0.1]]
    vim.cmd [[NvuiTitlebarFontFamily JetbrainsMono NerdFont Medium]]
    vim.cmd [[set guifont=JetBrainsMono\ Nerd\ Font\ Mono:h14]]
end
