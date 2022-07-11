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
    vim.cmd [[NvuiTitlebarFontFamily BlexMono Nerd Font]]
    vim.cmd [[set guifont=BlexMono\ Nerd\ Font:h14]]
end
