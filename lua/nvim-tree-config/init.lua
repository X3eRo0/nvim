local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

nvim_tree.setup {
    renderer = {
        add_trailing = false,
        group_empty = false,
        highlight_git = false,
        full_name = false,
        highlight_opened_files = "none",
        root_folder_modifier = ":~",
        indent_markers = {
            enable = false,
            icons = {
                corner = "└ ",
                edge = "│ ",
                item = "│ ",
                none = "  ",
            },
        },
        icons = {
            webdev_colors = true,
            git_placement = "before",
            padding = " ",
            symlink_arrow = " ➛ ",
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = false,
            },
            glyphs = {
                default = "",
                symlink = "",
                folder = {
                    arrow_closed = "",
                    arrow_open = "",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                },
                git = {
                    unstaged = "✗",
                    staged = "✓",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "★",
                    deleted = "",
                    ignored = "◌",
                },
            },
        },
        special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md", "CMakeLists.txt"},
    },
    respect_buf_cwd = true,
    disable_netrw = true,
    hijack_netrw = true,
    hijack_cursor = true,
    open_on_setup = false,
    ignore_ft_on_setup = {},
    open_on_tab = false,
    update_cwd = false,
    hijack_directories = {
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
    view = {
        width = 25,
        height = 25,
        hide_root_folder = false,
        side = "left",
        mappings = {
            custom_only = false,
            list = {}
        },
        number = false,
        relativenumber = false,
        signcolumn = "yes"
    },
   actions = {
       use_system_clipboard = true,
       change_dir = {
           enable = true,
           global = false,
           restrict_above_cwd = false,
       },
       expand_all = {
           max_folder_discovery = 300,
       },
       open_file = {
           quit_on_open = false,
           resize_window = true,
           window_picker = {
               enable = true,
               chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
               exclude = {
                   filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                   buftype = { "nofile", "terminal", "help" },
               },
           },
       },
       remove_file = {
           close_window = true,
       },
   },
}
