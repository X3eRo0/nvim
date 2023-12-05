local colors = {
    bg = "#efeff5",
    fg = "#212121",
    yellow = "#e0af68",
    cyan = "#56b6c2",
    darkblue = "#081633",
    green = "#98c379",
    orange = "#d19a66",
    violet = "#a9a1e1",
    magenta = "#c678dd",
    blue = "#61afef",
    red = "#e86671",
    mbg = "#b1b1cd",
}

local lsp = require("feline.providers.lsp")
local vi_mode_utils = require("feline.providers.vi_mode")

local vi_mode_colors = {
    NORMAL = colors.green,
    INSERT = colors.red,
    VISUAL = colors.magenta,
    OP = colors.green,
    BLOCK = colors.blue,
    REPLACE = colors.violet,
    ["V-REPLACE"] = colors.violet,
    ENTER = colors.cyan,
    MORE = colors.cyan,
    SELECT = colors.orange,
    COMMAND = colors.green,
    SHELL = colors.green,
    TERM = colors.green,
    NONE = colors.yellow,
}

local icons = {
    linux = " ",
    macos = " ",
    windows = " ",
    errs = " ",
    warns = " ",
    infos = " ",
    hints = " ",
    lsp = " ",
    git = "",
}

local function file_osinfo()
    local os = vim.bo.fileformat:upper()
    local icon
    if os == "UNIX" then
        icon = icons.linux
    elseif os == "MAC" then
        icon = icons.macos
    else
        icon = icons.windows
    end
    return icon .. os
end

local function lsp_diagnostics_info()
    return {
        errs = lsp.get_diagnostics_count("Error"),
        warns = lsp.get_diagnostics_count("Warn"),
        infos = lsp.get_diagnostics_count("Info"),
        hints = lsp.get_diagnostics_count("Hint"),
    }
end

local function diag_enable(f, s)
    return function()
        local diag = f()[s]
        return diag and diag ~= 0
    end
end

local function diag_of(f, s)
    local icon = icons[s]
    return function()
        local diag = f()[s]
        return icon .. diag
    end
end

local comps = {
    file = {
        info = {
            provider = function()
                return vim.fn.expand("%:t")
            end,
            hl = {
                fg = colors.bg,
            },
        },
        size = {
            provider = function()
                return tostring(vim.fn.getfsize(vim.fn.expand("%:t"))) .. "B"
            end,
            hl = {
                fg = colors.bg,
            },
        },
    },
    line_percentage = {
        provider = "line_percentage",
        left_sep = " ",
        hl = {
            style = "bold",
        },
    },
    diagnos = {
        err = {
            provider = diag_of(lsp_diagnostics_info, "errs"),
            left_sep = " ",
            enabled = diag_enable(lsp_diagnostics_info, "errs"),
            hl = {
                fg = colors.red,
            },
        },
        warn = {
            provider = diag_of(lsp_diagnostics_info, "warns"),
            left_sep = " ",
            enabled = diag_enable(lsp_diagnostics_info, "warns"),
            hl = {
                fg = colors.yellow,
            },
        },
        info = {
            provider = diag_of(lsp_diagnostics_info, "infos"),
            left_sep = " ",
            enabled = diag_enable(lsp_diagnostics_info, "infos"),
            hl = {
                fg = colors.blue,
            },
        },
        hint = {
            provider = diag_of(lsp_diagnostics_info, "hints"),
            left_sep = " ",
            enabled = diag_enable(lsp_diagnostics_info, "hints"),
            hl = {
                fg = colors.cyan,
            },
        },
    },
    lsp = {
        name = {
            provider = "lsp_client_names",
            left_sep = " ",
            icon = "",
            hl = {
                fg = colors.bg,
            },
        },
    },
    git = {
        branch = {
            provider = "git_branch",
            left_sep = " ",
            icon = "",
            hl = {
                fg = colors.bg,
            },
        },
        add = {
            provider = "git_diff_added",
            hl = {
                fg = colors.green,
            },
        },
        change = {
            provider = "git_diff_changed",
            hl = {
                fg = colors.orange,
            },
        },
        remove = {
            provider = "git_diff_removed",
            hl = {
                fg = colors.red,
            },
        },
    },
}

local properties = {
    force_inactive = {
        filetypes = {
            "NvimTree",
            "dbui",
            "packer",
            "startify",
            "fugitive",
            "fugitiveblame",
            "Dired",
        },
        buftypes = { "terminal" },
        bufnames = {},
    },
}

local components = {
    active = {},
    inactive = {},
}

-- left active
table.insert(components.active, {
    comps.file.info,
})

-- left inactive
table.insert(components.inactive, {
    comps.file.info,
})

-- middle active
table.insert(components.active, {
    comps.git.branch,
    comps.git.change,
    comps.git.remove,
    comps.lsp.name,
})

-- middle inactive
table.insert(components.inactive, {})

-- right active
table.insert(components.active, {
    comps.file.size,
    comps.line_percentage,
    comps.scroll_bar,
})

-- right inactive
table.insert(components.inactive, {})

require("feline").setup({
    default_bg = colors.bg,
    default_fg = colors.fg,
    components = components,
    properties = properties,
    vi_mode_colors = vi_mode_colors,
})
