M = {}

local colorscheme = "gruber-darker" -- gruber-darker

-- jellybeans-nvim
-- tokyonight
-- moonfly
-- nightfly
-- material
-- github_dark
-- github_dark_dimmed
-- github_dark_high_contrast
-- github_dark_colorblind
-- github_dark_tritanopia
-- github_light
-- github_light_high_contrast
-- github_light_colorblind
-- github_light_tritanopia
-- midnight
-- sonokai
-- omni
-- zephyr
-- everblush
-- boo-- sunset_cloud
-- boo-- radioactive_waste
-- boo-- forest_stream
-- boo-- crimson_moonlight
-- oxocarbon
-- aura
-- PaperColor
-- PaperColorSlim
-- tokyodark
-- modus-vivendi
-- modus-operandi
-- dogrun
-- hybrid
-- yugen
-- lackluster
-- obscure
-- gruvbox
-- midnight-desert
-- sakura
-- zenbones
-- vague
-- alabaster
-- gruber-darker
-- helix

local g = vim.g
local opt = vim.opt

M.setup = function()
    vim.cmd("colorscheme " .. colorscheme)
    vim.notify("Colorscheme loaded!", vim.log.levels.INFO, { render = "minimal" })

    -- Tokyonight
    if colorscheme == "tokyonight" then
        g.tokyonight_style = "night"
        g.tokyonight_italic_functions = false
        g.tokyonight_italic_comments = false
        g.tokyonight_italic_keywords = false
    end

    if colorscheme == "sonokai" then
        g.sonokai_style = "andromeda"
        g.sonokai_enable_italic = 0
        g.sonokai_disable_italic_comment = 0
    end

    if colorscheme == "sakura" then
        opt.background = "dark"
    end

    ---@diagnostic disable-next-line: empty-block
    if colorscheme == "vague" then
        require("vague").setup({
            colors = { comment = "#3a3a45" },
        })
    end

    if colorscheme == "PaperColor" then
        vim.opt.background = "dark" -- set this to dark or light
    end

    if colorscheme == "PaperColorSlim" then
        vim.opt.background = "dark" -- set this to dark or light
    end

    if colorscheme == "one-nvim" then
        vim.g.one_nvim_transparent_bg = true
    end

    -- modus-theme-vim
    if colorscheme:find("^modus") ~= nil then
        -- modus-vivendi
        -- modus-operandi
        vim.g.modus_moody_enable = true
        vim.g.modus_yellow_comments = true
        vim.g.modus_green_strings = true
        vim.g.modus_faint_syntax = true
        vim.g.modus_cursorline_intense = true
        vim.g.modus_termtrans_enable = true
        vim.g.modus_dim_inactive_window = true
    end

    if colorscheme:find("^github") ~= nil then
        -- github_dimmed
        -- github_dark_default
        -- github_dark_colorblind
        -- github_light
        -- github_light_default
        -- github_light_colorblind
        require("github-theme").setup({
            options = {
                style = {
                    functions = "NONE",
                    comments = "NONE",
                    keywords = "NONE",
                    -- Change the "hint" color to the "orange" color, and make the "error" color bright red
                },
                darken = {
                    floats = true,
                    sidebars = {
                        list = {
                            "qf",
                            "vista_kind",
                            "terminal",
                            "packer",
                        },
                    },
                },
            },
            specs = {
                all = {
                    hint = "orange",
                    error = "#ff0000",
                },
            },
        })
    end

    if colorscheme == "boo" then
        require("boo-colorscheme").use({
            -- theme = "crimson_moonlight",
            -- theme = "forest_stream",
            -- theme = "sunset_cloud",
            italic = false,
            theme = "crimson_moonlight",
        })
    end
    if colorscheme == "oxocarbon" then
        -- vim.g.oxocarbon_lua_disable_italic = 1
        vim.opt.background = "dark" -- set this to dark or light
    end

    if colorscheme == "moonfly" then
        g.moonflyItalics = false
        g.moonflyUndercurls = false
        g.moonflyUnderlineMatchParen = false
        g.moonflyWinSeparator = 2
        opt.fillchars = {
            horiz = "━",
            horizup = "┻",
            horizdown = "┳",
            vert = "┃",
            vertleft = "┫",
            vertright = "┣",
            verthoriz = "╋",
        }
    end

    if colorscheme == "vscode" then
        -- -- For dark theme
        vim.g.vscode_style = "dark"
        -- -- For light theme
        -- vim.g.vscode_style = "light"
        -- -- Enable transparent background
        -- vim.g.vscode_transparent = 1
        -- -- Enable italic comment
        vim.g.vscode_italic_comment = false
        -- -- Disable nvim-tree background color
        vim.g.vscode_disable_nvimtree_bg = true
    end

    if colorscheme == "rose-pine" then
        -- Options (see available options below)
        require("rose-pine").setup({
            --- @usage 'main' | 'moon'
            dark_variant = "main",
            styles = {
                bold = true,
                italic = false,
                transparency = true,
            },

            --- @usage string hex value or named color from rosepinetheme.com/palette
            groups = {
                background = "base",
                panel = "surface",
                border = "highlight_med",
                comment = "muted",
                link = "iris",
                punctuation = "subtle",

                error = "love",
                hint = "iris",
                info = "foam",
                warn = "gold",

                headings = {
                    h1 = "iris",
                    h2 = "foam",
                    h3 = "rose",
                    h4 = "gold",
                    h5 = "pine",
                    h6 = "foam",
                },
                -- or set all headings at once
                -- headings = 'subtle'
            },

            -- Change specific vim highlight groups
            highlight_groups = {
                ColorColumn = { bg = "rose" },
            },
        })
    end
    if colorscheme == "catppuccin" then
        g.catppuccin_flavor = "frappe" -- "latte", "machhiato", "mocha"
        require("catppuccin").setup({
            transparent_background = false,
            term_colors = false,
            styles = {
                comments = "NONE",
                conditionals = "NONE",
                loops = "NONE",
                functions = "NONE",
                keywords = "NONE",
                strings = "NONE",
                variables = "NONE",
                numbers = "NONE",
                booleans = "NONE",
                properties = "NONE",
                types = "NONE",
                operators = "NONE",
            },
            integrations = {
                treesitter = true,
                native_lsp = {
                    enabled = true,
                    virtual_text = {
                        errors = "NONE",
                        hints = "NONE",
                        warnings = "NONE",
                        information = "NONE",
                    },
                    underlines = {
                        errors = "underline",
                        hints = "underline",
                        warnings = "underline",
                        information = "underline",
                    },
                },
                coc_nvim = false,
                lsp_trouble = false,
                cmp = true,
                lsp_saga = false,
                gitgutter = false,
                gitsigns = true,
                telescope = true,
                nvimtree = {
                    enabled = true,
                    show_root = false,
                    transparent_panel = false,
                },
                neotree = {
                    enabled = false,
                    show_root = false,
                    transparent_panel = false,
                },
                which_key = false,
                indent_blankline = {
                    enabled = true,
                    colored_indent_levels = false,
                },
                dashboard = true,
                neogit = false,
                vim_sneak = false,
                fern = false,
                barbar = false,
                bufferline = true,
                markdown = true,
                lightspeed = false,
                ts_rainbow = false,
                hop = false,
                notify = true,
                telekasten = true,
                symbols_outline = true,
            },
        })
    end

    -- Material
    if colorscheme == "material" then
        g.material_style = "deep ocean"
        require("material").setup({
            contrast = {
                sidebars = true,
                floating_windows = true,
                non_current_windows = true,
                popup_menu = true,
            },
            italics = {
                comments = false,
                functions = false,
                keywords = false,
            },
            high_visibility = {
                darker = true,
            },
        })
        -- notify if setup is loaded
        -- vim.notify("Material and Setup loaded!", "info", { render = "minimal" })
    end

    -- post config
    if colorscheme == "sakura" then
        local purple = "#957fb8"
        local gray = "#505050"
        local faded_gray = "#303030"
        local strong_faded_gray = "#151515"
        local almost_black = "#151515"
        local black = "#000000"
        local white = "#ffffff"

        local highlights = {
            -- remove bg color
            Normal = { bg = black },
            NormalFloat = { bg = black },

            --general
            Visual = { bg = almost_black },
            ModeMsg = { fg = purple },
            CursorLineNr = { fg = purple },
            CursorLine = { bg = almost_black },
            WinSeparator = { fg = strong_faded_gray },
            MatchParen = { bg = faded_gray },

            -- git signs
            GitSignsAdd = { fg = purple },
            GitSignsAddNr = { fg = purple },
            GitSignsAddLn = { fg = purple },
            GitSignsChange = { fg = purple },
            GitSignsChangeNr = { fg = purple },
            GitSignsChangeLn = { fg = purple },
            GitSignsChangedelete = { fg = purple },

            -- nvim tree
            NvimTreeNormal = { bg = black },
            NvimTreeNormalFloat = { bg = black },
            NvimTreeGitDirty = { fg = purple },
            NvimTreeGitStaged = { fg = purple },
            NvimTreeGitMerge = { fg = purple },
            NvimTreeGitRenamed = { fg = purple },
            NvimTreeGitNew = { fg = purple },
            NvimTreeGitDeleted = { fg = purple },
            NvimTreeSpecialFile = { bold = true },
            NvimTreeCursorLine = { bg = almost_black },
            NvimTreeIndentMarker = { fg = gray },
            NvimTreeFolderIcon = { fg = white },
            NvimTreeFolderIconOpen = { fg = white },
            NvimTreeFolderSymlink = { fg = white },
            NvimTreeDefault = { fg = white },
            NvimTreeSymlink = { fg = white },
            NvimTreeBookmark = { fg = white },
            NvimTreeFileIcon = { bg = white, fg = white },

            -- bufferline
            BufferLineFill = { bg = black },
            BufferLineBackground = { bg = black, fg = faded_gray }, -- unactive tabs to faded gray
            BufferLineSeparator = { bg = black, fg = black },
            BufferLineModified = { fg = black },
            BufferlineBufferSelected = { fg = white }, -- active tabs to white
            BufferlineBufferVisible = { fg = white }, -- active tabs to white
            BufferLineIndicatorVisible = { fg = black },
        }

        -- icon hack
        local icons = require("nvim-web-devicons")
        local new_icons = {}
        for key, icon in pairs(icons.get_icons()) do
            icon.color = white -- icons in file tree
            new_icons[key] = icon
            highlights["BufferLineDevIcon" .. icon.name] = { fg = faded_gray } -- unactive tabs to faded gray
            highlights["BufferLineDevIcon" .. icon.name .. "Selected"] = { fg = white } -- active tabs to gray
        end
        icons.set_icon(new_icons)

        -- set highlight colors
        for group, colors in pairs(highlights) do
            vim.api.nvim_set_hl(0, group, colors)
        end
    end
end

M.is_active = function(scheme)
    return colorscheme:find(scheme, 1, true) ~= nil
end

return M
