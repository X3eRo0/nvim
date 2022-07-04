local colorscheme = "PaperColor"
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
            verthoriz = "╋"
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
        vim.g.rose_pine_variant = "base"
    end
    if colorscheme == "catppuccin" then
        g.catppuccin_flavor = "frappe" -- "latte", "machhiato", "mocha"
        require("catppuccin").setup(
            {
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
                    operators = "NONE"
                },
                integrations = {
                    treesitter = true,
                    native_lsp = {
                        enabled = true,
                        virtual_text = {
                            errors = "NONE",
                            hints = "NONE",
                            warnings = "NONE",
                            information = "NONE"
                        },
                        underlines = {
                            errors = "underline",
                            hints = "underline",
                            warnings = "underline",
                            information = "underline"
                        }
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
                        transparent_panel = false
                    },
                    neotree = {
                        enabled = false,
                        show_root = false,
                        transparent_panel = false
                    },
                    which_key = false,
                    indent_blankline = {
                        enabled = true,
                        colored_indent_levels = false
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
                    symbols_outline = true
                }
            }
        )
    end

    -- Material
    if colorscheme == "material" then
        g.material_style = "deep ocean"
        require("material").setup(
            {
                contrast = {
                    sidebars = true,
                    floating_windows = true,
                    non_current_windows = true,
                    popup_menu = true
                },
                italics = {
                    comments = false,
                    functions = false,
                    keywords = false
                },
                high_visibility = {
                    darker = true
                }
            }
        )
        -- notify if setup is loaded
        vim.notify("Material and Setup loaded!", "info", {render = "minimal"})
    end

    -- re-require
    cmd("colo " .. colorscheme)
    vim.notify("Colorscheme loaded!", "info", {render = "minimal"})
end
