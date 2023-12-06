local colors = {
    bg = "#efeff5",
    fg = "#101010",
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

---@alias vim_wintype
---| ""         # normal window (or NvimTree)
---| "autocmd"  # autocommand window. Temporary window used to execute autocommands
---| "command"  # command-line window `cmdwin`
---| "loclist"  # `location-list-window`
---| "popup"    # popup window `popup`
---| "preview"  # preview window `preview-window`
---| "quickfix" # `quickfix-window`
---| "unknown"  # window `{nr}` not found

---@alias vim_buftype
---| ""         # normal buffer
---| "acwrite"  # buffer will always be written with `BufWriteCmd`s
---| "help"     # help buffer (do not set this manually)
---| "nofile"   # buffer is not related to a file, will not be written (NvimTree)
---| "nowrite"  # buffer will not be written
---| "prompt"   # buffer where only the last line can be edited, meant to be used by a plugin, see `prompt-buffer`
---| "quickfix" # list of errors `:cwindow` or locations `:lwindow`
---| "terminal" # `terminal-emulator` buffer

---@alias wintype
---| "unknown"
---| "normal"
---| "loclist"
---| "quickfix"
---| "preview"
---| "help"
---| "netrw"
---| "lazy"           # folke/lazy.nvim
---| "packer"         # wbthomason/packer.nvim
---| "neogit"         # TimUntersberger/neogit
---| "fugitive"       # tpope/vim-fugitive
---| "telescope"      # nvim-telescope/telescope.nvim
---| "buffer_manager" # j-morano/buffer_manager.nvim
---| "nvimtree"       # nvim-tree/nvim-tree.lua
---| "neo-tree"       # nvim-neo-tree/neo-tree.nvim
---| "dirbuf"         # elihunter173/dirbuf.nvim

---Returns window type
---@param win_id number|nil
---@return wintype enum
local function get_wintype(win_id)
    win_id = win_id or vim.fn.win_getid()
    ---@type vim_wintype
    local vim_wintype = vim.fn.win_gettype(win_id)
    ---@type vim_buftype
    local buftype = vim.o.buftype
    ---@type string
    local filetype = vim.o.filetype

    ---@type wintype
    local wintype = "unknown"

    if vim_wintype == "" or vim_wintype == "popup" then
        if buftype == "" then
            if filetype == "netrw" then
                wintype = "netrw"
            else
                wintype = "normal"
            end
        elseif buftype == "nofile" then
            if filetype == "NvimTree" then
                wintype = "nvimtree"
            elseif filetype == "neo-tree" then
                wintype = "neo-tree"
            elseif filetype == "packer" then
                wintype = "packer"
            elseif filetype:find("Neogit") ~= nil then
                wintype = "neogit"
            elseif filetype == "lazy" then
                wintype = "lazy"
            else
                wintype = "unknown"
            end
        elseif buftype == "prompt" then
            if filetype:find("Telescope") ~= nil then
                wintype = "telescope"
            end
        elseif buftype == "nowrite" then
            if filetype == "fugitive" then
                wintype = "fugitive"
            end
        elseif buftype == "help" then
            wintype = "help"
        elseif buftype == "acwrite" then
            if filetype == "dirbuf" then
                wintype = "dirbuf"
            elseif filetype == "buffer_manager" then
                wintype = "buffer_manager"
            elseif filetype == "dired" then
                wintype = "dired"
            end
        end
    elseif vim_wintype == "loclist" then
        wintype = "loclist"
    elseif vim_wintype == "quickfix" then
        wintype = "quickfix"
    elseif vim_wintype == "preview" then
        wintype = "preview"
    end

    -- for debug
    --vim.api.nvim_notify(
    --	"vim wintype '" .. vim_wintype ..
    --	"', buftype '" .. buftype ..
    --	"', filetype '" .. filetype ..
    --	"', wintype '" .. wintype .. "'",
    --	vim.log.levels.INFO,
    --{})
    return wintype
end

local lsp = require("feline.providers.lsp")

local icons = {
    errs = " ",
    warns = " ",
    infos = " ",
    hints = " ",
}

local function git_diff(type)
    ---@diagnostic disable-next-line: undefined-field
    local gsd = vim.b.gitsigns_status_dict

    if gsd and gsd[type] and gsd[type] > 0 then
        return tostring(gsd[type])
    end

    return ""
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
            left_sep = " | ",
            hl = {
                fg = colors.bg,
            },
        },
    },
    line_percentage = {
        provider = "line_percentage",
        left_sep = " | ",
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
            style = "bold",
        },
        add = {
            provider = function()
                return git_diff("added"), "+"
            end,
            left_sep = " ",
            hl = {
                fg = colors.green,
            },
        },
        change = {
            provider = function()
                return git_diff("changed"), "~"
            end,
            left_sep = " ",
            hl = {
                fg = colors.orange,
            },
        },
        remove = {
            provider = function()
                return git_diff("removed"), "-"
            end,
            left_sep = " ",
            hl = {
                fg = colors.red,
            },
        },
    },
    right_end = {
        provider = function()
            return " ]"
        end,
        style = "bold",
        hl = {
            fg = colors.bg,
        },
    },
    left_end = {
        provider = function()
            return "[ "
        end,
        style = "bold",
        hl = {
            fg = colors.bg,
        },
    },
    inactive_middle = {
        provider = function()
            local wintype = get_wintype()
            if wintype == "dired" then
                return vim.g.current_dired_path
            elseif wintype == "neogit" then
                return "Neogit"
            elseif wintype == "telescope" then
                return "Telescope"
            elseif wintype == "packer" then
                return "Packer"
            elseif wintype == "unknown" then
                return "¯\\_(ツ)_/¯"
            end
        end,
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
            "dired",
            "",
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
    comps.left_end,
    comps.file.info,
    comps.diagnos.info,
    comps.diagnos.err,
    comps.diagnos.hint,
    comps.diagnos.warn,
})

-- left inactive
table.insert(components.inactive, {
    comps.left_end,
})

-- middle active
table.insert(components.active, {
    comps.git.branch,
    comps.git.add,
    comps.git.remove,
    comps.git.change,
    comps.lsp.name,
})

-- middle inactive
table.insert(components.inactive, {
    comps.inactive_middle,
})

-- right active
table.insert(components.active, {
    comps.file.size,
    comps.line_percentage,
    comps.right_end,
})

-- right inactive
table.insert(components.inactive, {
    comps.right_end,
})

require("feline").setup({
    default_bg = colors.bg,
    default_fg = colors.fg,
    components = components,
    properties = properties,
})
