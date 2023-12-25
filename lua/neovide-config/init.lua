if vim.g.neovide then
    -- Put anything you want to happen only in Neovide here

    -- guifont
    vim.o.guifont = "Liga SFMono Nerd Font:h11" -- text below applies for VimScript

    -- scroll animation length
    vim.g.neovide_scroll_animation_length = 0.1

    -- remember previous window size
    vim.g.neovide_remember_window_size = true

    -- cursor settings.
    vim.g.neovide_cursor_animation_length = 0.1
    vim.g.neovide_cursor_trail_size = 0
    vim.g.neovide_cursor_animate_in_insert_mode = false
    vim.g.neovide_cursor_animate_command_line = false

    -- configuration to change font scale dynamically.
    vim.g.neovide_scale_factor = 1.0
    local change_scale_factor = function(delta)
        vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
    end
    vim.keymap.set("n", "<C-=>", function()
        change_scale_factor(1.1)
    end)
    vim.keymap.set("n", "<C-->", function()
        change_scale_factor(1 / 1.1)
    end)
end
