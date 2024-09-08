-- jellybeans-nvim
-- tokyonight
-- moonfly
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

local colorscheme = "hybrid" -- aura
local cmd = vim.api.nvim_command
local g = vim.g
local opt = vim.opt

local colo_ok, _ = pcall(cmd, "colo " .. colorscheme)
if not colo_ok then
    vim.notify("Colorscheme " .. colorscheme .. " not found!")
    return
else
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

    if colorscheme == "PaperColor" then
        vim.opt.background = "dark" -- set this to dark or light
    end

    if colorscheme == "PaperColorSlim" then
        vim.opt.background = "dark" -- set this to dark or light
    end

    if colorscheme == "one-nvim" then
        vim.g.one_nvim_transparent_bg = false
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
            theme = "radioactive_waste",
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
            bold_vert_split = false,
            dim_nc_background = false,
            disable_background = false,
            disable_float_background = false,
            disable_italics = true,

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

        -- set colorscheme after options
        vim.cmd("colorscheme rose-pine")
        --
        --
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
        vim.notify("Material and Setup loaded!", "info", { render = "minimal" })
    end

    -- re-require
    cmd("colo " .. colorscheme)
    vim.notify("Colorscheme loaded!", "info", { render = "minimal" })
end
