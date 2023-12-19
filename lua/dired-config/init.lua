require("dired").setup({
    path_separator = "/",
    show_hidden = true,
    show_banner = false,
    hide_details = false,
    sort_order = "name",
    keybinds = {
        dired_enter = "<cr>",
        dired_back = "-",
        dired_up = "_",
        dired_rename = "R",
        dired_create = "d",
        dired_delete = "D",
        dired_delete_range = "D",
        dired_copy = "C",
        dired_copy_range = "C",
        dired_copy_marked = "MC",
        dired_move = "X",
        dired_move_range = "X",
        dired_move_marked = "MX",
        dired_paste = "P",
        dired_mark = "M",
        dired_mark_range = "M",
        dired_delete_marked = "MD",
        dired_toggle_hidden = ".",
        dired_toggle_sort_order = ",",
        dired_toggle_colors = "c",
        dired_toggle_hide_details = "(",
        dired_quit = "q",
    },
    colors = {
        DiredDirectoryName = { link = {}, bg = "NONE", fg = "9370DB", gui = "bold" },
    },
})
