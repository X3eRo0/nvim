local neogit = require("neogit")

neogit.setup {
    disable_signs = true,
    disable_hint = false,
    disable_context_highlighting = false,
    disable_commit_confirmation = false,
    -- Neogit refreshes its internal state after specific events, which can be expensive depending on the repository size.
    -- Disabling `auto_refresh` will make it so you have to manually refresh the status after you open it.
    auto_refresh = true,
    disable_builtin_notifications = false,
    use_magit_keybindings = true,
    commit_popup = {
        kind = "split"
    },
    -- Change the default way of opening neogit
    kind = "tab",
    -- customize displayed signs
    integrations = {
        -- Neogit only provides inline diffs. If you want a more traditional way to look at diffs, you can use `sindrets/diffview.nvim`.
        -- The diffview integration enables the diff popup, which is a wrapper around `sindrets/diffview.nvim`.
        --
        -- Requires you to have `sindrets/diffview.nvim` installed.
        -- use {
        --   'TimUntersberger/neogit',
        --   requires = {
        --     'nvim-lua/plenary.nvim',
        --     'sindrets/diffview.nvim'
        --   }
        -- }
        --
        diffview = true
    },
    -- override/add mappings
    mappings = {
        -- modify status buffer mappings
        status = {
            -- Adds a mapping with "B" as key that does the "BranchPopup" command
            ["B"] = "BranchPopup",
            -- Removes the default mapping of "s"
            -- ["s"] = ""
        }
    }
}

vim.cmd("hi NeogitNotificationInfo guifg=#80ff95")
vim.cmd("hi NeogitNotificationWarning guifg=#fff454")
vim.cmd("hi NeogitNotificationError guifg=#c44323")

vim.cmd("hi def NeogitDiffAddHighlight guibg=#404040 guifg=#859900")
vim.cmd("hi def NeogitDiffDeleteHighlight guibg=#404040 guifg=#dc322f")
vim.cmd("hi def NeogitDiffContextHighlight guibg=#333333 guifg=#b2b2b2")
vim.cmd("hi def NeogitHunkHeader guifg=#cccccc guibg=#404040")
vim.cmd("hi def NeogitHunkHeaderHighlight guifg=#cccccc guibg=#4d4d4d")
