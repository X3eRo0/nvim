if vim.g.nvui then
    -- Configure through vim commands
    vim.cmd [[NvuiTitlebarFontSize 13]]
    vim.cmd [[NvuiScrollAnimationDuration 0.1]]
    vim.cmd [[NvuiCursorAnimationDuration 0.1]]
    vim.cmd [[NvuiTitlebarFontFamily JetBrains Mono]]
    vim.cmd [[set guifont=JetBrains\ Mono:h13]]
end

require("plugins")
require("keybindings")
require("options")
require("comment-config")
require("nvim-tree-config")
