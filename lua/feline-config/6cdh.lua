local colors = {
    bg = "#14141f",
    fg = "#efeff5",
    yellow = "#e0af68",
    cyan = "#56b6c2",
    darkblue = "#081633",
    green = "#98c379",
    orange = "#d19a66",
    violet = "#a9a1e1",
    magenta = "#c678dd",
    blue = "#61afef",
    red = "#e86671",
    mbg = "#b1b1cd"
}

local lsp = require "feline.providers.lsp"
local vi_mode_utils = require "feline.providers.vi_mode"

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
    NONE = colors.yellow
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
    git = ""
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
        hints = lsp.get_diagnostics_count("Hint")
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

local function vimode_hl()
    return {
        name = vi_mode_utils.get_mode_highlight_name(),
        fg = colors.bg,
        bg = colors.fg,
        style = "bold"
    }
end

-- LuaFormatter off

local comps = {
    vi_mode = {
        left = {
            provider = function()
                local text = " " .. vi_mode_utils.get_vim_mode() .. " "
                return text
            end,
            hl = vimode_hl,
            right_sep = " "
        },
        right = {
            provider = "▊",
            hl = vimode_hl,
            left_sep = " "
        }
    },
    file = {
        info = {
            provider = "file_info",
            hl = {
                fg = colors.blue,
                style = "bold"
            }
        },
        encoding = {
            provider = "file_encoding",
            left_sep = " ",
            hl = {
                fg = colors.violet,
                style = "bold"
            }
        },
        type = {
            provider = "file_type"
        },
        os = {
            provider = file_osinfo,
            left_sep = " ",
            hl = {
                fg = colors.violet,
                style = "bold"
            }
        }
    },
    line_percentage = {
        provider = "line_percentage",
        left_sep = " ",
        hl = {
            style = "bold"
        }
    },
    scroll_bar = {
        provider = "scroll_bar",
        left_sep = " ",
        hl = {
            fg = colors.blue,
            style = "bold"
        }
    },
    diagnos = {
        err = {
            provider = diag_of(lsp_diagnostics_info, "errs"),
            left_sep = " ",
            enabled = diag_enable(lsp_diagnostics_info, "errs"),
            hl = {
                fg = colors.red
            }
        },
        warn = {
            provider = diag_of(lsp_diagnostics_info, "warns"),
            left_sep = " ",
            enabled = diag_enable(lsp_diagnostics_info, "warns"),
            hl = {
                fg = colors.yellow
            }
        },
        info = {
            provider = diag_of(lsp_diagnostics_info, "infos"),
            left_sep = " ",
            enabled = diag_enable(lsp_diagnostics_info, "infos"),
            hl = {
                fg = colors.blue
            }
        },
        hint = {
            provider = diag_of(lsp_diagnostics_info, "hints"),
            left_sep = " ",
            enabled = diag_enable(lsp_diagnostics_info, "hints"),
            hl = {
                fg = colors.cyan
            }
        }
    },
    lsp = {
        name = {
            provider = "lsp_client_names",
            left_sep = " ",
            icon = icons.lsp,
            hl = {
                fg = colors.yellow
            }
        }
    },
    git = {
        branch = {
            provider = "git_branch",
            icon = icons.git,
            left_sep = " ",
            hl = {
                fg = colors.violet,
                style = "bold"
            }
        },
        add = {
            provider = "git_diff_added",
            hl = {
                fg = colors.green
            }
        },
        change = {
            provider = "git_diff_changed",
            hl = {
                fg = colors.orange
            }
        },
        remove = {
            provider = "git_diff_removed",
            hl = {
                fg = colors.red
            }
        }
    }
}

local properties = {
    force_inactive = {
        filetypes = {
            "NvimTree",
            "dbui",
            "packer",
            "startify",
            "fugitive",
            "fugitiveblame"
        },
        buftypes = {"terminal"},
        bufnames = {}
    }
}

-- local components = {
--     left = {
--         active = {
--             comps.vi_mode.left,
--             comps.file.info,
--             comps.lsp.name,
--             comps.diagnos.err,
--             comps.diagnos.warn,
--             comps.diagnos.hint,
--             comps.diagnos.info
--         },
--         inactive = {
--             comps.vi_mode.left,
--             comps.file.info
--         }
--     },
--     mid = {
--         active = {},
--         inactive = {}
--     },
--     right = {
--         active = {
--             comps.git.add,
--             comps.git.change,
--             comps.git.remove,
--             comps.file.os,
--             comps.git.branch,
--             comps.line_percentage,
--             comps.scroll_bar,
--             comps.vi_mode.right
--         },
--         inactive = {}
--     }
-- }

local components = {
    active = {},
    inactive = {}
}

-- left active
table.insert(
    components.active,
    {
        comps.vi_mode.left
    }
)

-- left inactive
table.insert(
    components.inactive,
    {
        comps.vi_mode.left
    }
)

-- middle active
table.insert(
    components.active,
    {
        comps.file.info,
        comps.lsp.name,
        comps.diagnos.err,
        comps.diagnos.warn,
        comps.diagnos.hint,
        comps.diagnos.info
    }
)

-- middle inactive
table.insert(
    components.inactive,
    {
        comps.file.info
    }
)

-- right active
table.insert(
    components.active,
    {
        comps.git.add,
        comps.git.change,
        comps.git.remove,
        comps.file.os,
        comps.git.branch,
        comps.line_percentage,
        comps.scroll_bar,
        comps.vi_mode.right
    }
)
-- right inactive
table.insert(
    components.inactive,
    {
        comps.vi_mode.right
    }
)

-- LuaFormatter on

require "feline".setup {
    default_bg = colors.bg,
    default_fg = colors.fg,
    components = components,
    properties = properties,
    vi_mode_colors = vi_mode_colors
}
