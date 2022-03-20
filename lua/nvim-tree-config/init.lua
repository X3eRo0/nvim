local nvim_tree_icons = {
    default = "",
    symlink = "",
    git = {
        deleted = "",
        ignored = "◌",
        renamed = "➜",
        staged = "✓",
        unmerged = "",
        unstaged = "✗",
        untracked = "★"
    },
    folder = {
        default = "",
        empty = "",
        empty_open = "",
        open = "",
        symlink = "",
        symlink_open = ""
    }
}

nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1,
    folder_arrows = 0
}

vim.api.nvim_set_var("nvim_tree_icons", nvim_tree_icons)
vim.api.nvim_set_var("nvim_tree_show_icons", nvim_tree_show_icons)
vim.api.nvim_set_var("nvim_tree_git_hl", 1) -- will enable file highlight for git attributes
vim.api.nvim_set_var("nvim_tree_highlight_opened_files", 3) -- will enable folder and file icon highlight for opened files/directories
vim.api.nvim_set_var("nvim_tree_create_in_closed_folder", 1) -- When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when 0, and inside the folder when 1
vim.api.nvim_set_var("nvim_tree_add_trailing", 1) -- append a trailing slash to folder names
vim.api.nvim_set_var("nvim_tree_respect_buf_cwd", 1) -- Creating a file when the cursor is on a closed folder will set the path to be inside the closed folder when 1, and on the parent folder when 0

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
    return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup {
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = true,
    ignore_ft_on_setup = {},
    auto_close = false,
    open_on_tab = false,
    hijack_cursor = false,
    update_cwd = true,
    update_to_buf_dir = {
        enable = true,
        auto_open = true
    },
    diagnostics = {
        enable = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = ""
        }
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {}
    },
    system_open = {
        cmd = nil,
        args = {}
    },
    filters = {
        dotfiles = false,
        custom = {".git", "node_modules", ".cache", "__pycache__"}
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 500
    },
    git_hl = 1,
    show_icons = {
        git = 1,
        folders = 1,
        files = 1,
        folder_arrows = 1,
        tree_width = 25
    },
    view = {
        width = 25,
        height = 25,
        hide_root_folder = false,
        side = "left",
        auto_resize = true,
        mappings = {
            custom_only = false,
            list = {}
        },
        number = false,
        relativenumber = false,
        signcolumn = "yes"
    }
}
