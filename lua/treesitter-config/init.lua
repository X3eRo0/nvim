require "nvim-treesitter.configs".setup {
    ensure_installed = {"html", "javascript", "lua", "c", "cpp", "python"},
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
    },
    autotag = {
        enable = true
    },
    rainbow = {
        enable = true,
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil -- Do not enable for files with more than n lines, int
        -- colors = {}, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
    },
    autopairs = {
        enable = true
    }
}
