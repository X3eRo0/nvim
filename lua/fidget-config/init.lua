require("fidget").setup({
    -- Options related to LSP progress subsystem
    progress = {
        poll_rate = 0, -- How and when to poll for progress messages
        suppress_on_insert = false, -- Suppress new messages while in insert mode
        ignore_done_already = false, -- Ignore new tasks that are already complete
        -- How to get a progress message's notification group key
        notification_group = function(msg)
            return msg.lsp_name
        end,
        ignore = {}, -- List of LSP servers to ignore

        -- Options related to how LSP progress messages are displayed as notifications
        display = {
            render_limit = 5, -- How many LSP messages to show at once
            done_ttl = 3, -- How long a message should persist after completion
            done_icon = "✔", -- Icon shown when all LSP progress tasks are complete
            done_style = "Constant", -- Highlight group for completed LSP tasks
            progress_ttl = math.huge, -- How long a message should persist when in progress
            -- Icon shown when LSP progress tasks are in progress
            progress_icon = { pattern = "earth", period = 1 },
            -- Highlight group for in-progress LSP tasks
            progress_style = "WarningMsg",
            group_style = "Title", -- Highlight group for group name (LSP server name)
            icon_style = "Question", -- Highlight group for group icons
            priority = 30, -- Ordering priority for LSP notification group
            -- How to format a progress message
            format_message = require("fidget.progress.display").default_format_message,
            -- How to format a progress annotation
            format_annote = function(msg)
                return msg.title
            end,
            -- How to format a progress notification group's name
            format_group_name = function(group)
                return tostring(group)
            end,
        },
    },

    -- Options related to notification subsystem
    notification = {
        poll_rate = 10, -- How frequently to update and render notifications
        filter = vim.log.levels.INFO, -- Minimum notifications level
        override_vim_notify = false, -- Automatically override vim.notify() with Fidget
        -- How to configure notification groups when instantiated
        configs = { default = require("fidget.notification").default_config },

        -- Options related to how notifications are rendered as text
        view = {
            stack_upwards = true, -- Display notification items from bottom to top
            icon_separator = " ", -- Separator between group name and icon
            group_separator = "---", -- Separator between notification groups
            -- Highlight group used for group separator
            group_separator_hl = "Comment",
        },

        -- Options related to the notification window and buffer
        window = {
            normal_hl = "Comment", -- Base highlight group in the notification window
            winblend = 100, -- Background color opacity in the notification window
            border = "none", -- Border around the notification window
            zindex = 45, -- Stacking priority of the notification window
            max_width = 0, -- Maximum width of the notification window
            max_height = 0, -- Maximum height of the notification window
            x_padding = 1, -- Padding from right edge of window boundary
            y_padding = 0, -- Padding from bottom edge of window boundary
            align_bottom = true, -- Whether to bottom-align the notification window
            relative = "editor", -- What the notification window position is relative to
        },
    },

    -- Options related to logging
    logger = {
        level = vim.log.levels.WARN, -- Minimum logging level
        float_precision = 0.01, -- Limit the number of decimals displayed for floats
        -- Where Fidget writes its logs to
        path = string.format("%s/fidget.nvim.log", vim.fn.stdpath("cache")),
    },
})
