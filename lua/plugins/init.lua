local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end

local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
    command = "source <afile> | PackerCompile",
    group = packer_group,
    pattern = vim.fn.expand("$MYVIMRC"),
})

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
    -- Packer can manage itself
    use({ "wbthomason/packer.nvim" })

    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        event = "BufWinEnter",
        config = "require('treesitter-config')",
    })

    use({ "kyazdani42/nvim-web-devicons" })

    use({
        "onsails/lspkind.nvim",
    })

    use({
        "j-hui/fidget.nvim",
        config = "require('fidget-config')",
    })

    use({
        "windwp/nvim-ts-autotag",
        after = "nvim-treesitter",
    })

    use({
        "p00f/nvim-ts-rainbow",
        after = "nvim-treesitter",
    })

    use({
        "windwp/nvim-autopairs",
        config = "require('autopairs-config')",
        after = "nvim-cmp",
    })

    use({
        "nvim-telescope/telescope.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        cmd = "Telescope",
        config = "require('telescope-config')",
    })

    use({ "hrsh7th/cmp-nvim-lsp" })
    use({ "hrsh7th/cmp-buffer" })
    use({ "hrsh7th/cmp-path" })
    use({ "hrsh7th/nvim-cmp" })
    use({ "hrsh7th/cmp-vsnip" })
    use({ "hrsh7th/vim-vsnip" })
    use({ "hrsh7th/vim-vsnip-integ" })
    use({ "rafamadriz/friendly-snippets" })
    use({
        "norcalli/nvim-colorizer.lua",
        config = "require('colorizer-config')",
        event = "BufRead",
    })
    use({
        "lewis6991/gitsigns.nvim",
        config = "require('gitsigns-config')",
    })
    use({
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup()
        end,
    })
    use({
        "numToStr/Comment.nvim",
        config = "require('comment-config')",
    })
    use({ "monaqa/dial.nvim" })
    use({
        "lukas-reineke/indent-blankline.nvim",
        commit = "3ad57e569d1c47cf4fa2308f555003e0a5509204",
        config = "require('blankline-config')",
        event = "BufRead",
    })
    use({
        "mhartington/formatter.nvim",
        config = "require('format-config')",
        event = "VimEnter",
    })
    use({
        "nvimdev/lspsaga.nvim",
        after = "nvim-lspconfig",
        config = "require('lsp/lspsaga')",
    })

    use({
        "akinsho/toggleterm.nvim",
        config = "require('toggleterm-config')",
    })

    use({
        "andweeb/presence.nvim",
        config = function()
            require("presence"):setup({
                -- General options
                auto_update = true,
                neovim_image_text = "The One True Text Editor",
                main_image = "neovim",
                client_id = "793271441293967371",
                log_level = nil,
                debounce_timeout = 10,
                enable_line_number = false,
                blacklist = {},
                buttons = true,
                -- Rich Presence text options
                editing_text = "Editing %s",
                file_explorer_text = "Browsing %s",
                git_commit_text = "Committing changes",
                plugin_manager_text = "Managing plugins",
                reading_text = "Reading %s",
                workspace_text = "Working on %s",
                line_number_text = "Line %s out of %s",
            })
        end,
    })

    use({
        "fedepujol/move.nvim",
    })

    use({
        "freddiehaddad/feline.nvim",
        config = "require('feline-config')",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
    })
    use({
        "famiu/bufdelete.nvim",
    })

    use({
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    })

    use({
        "neovim/nvim-lspconfig",
        config = "require('lsp')",
    })

    use({
        "X3eRo0/dired.nvim",
        requires = "MunifTanjim/nui.nvim",
        config = "require('dired-config')",
    })

    use({
        "nvim-lua/plenary.nvim",
    })
    use({
        "TimUntersberger/neogit",
        requires = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
        },
        config = "require('neogit-config')",
    })
    -- use({
    --     "strash/everybody-wants-that-line.nvim",
    --     config = function()
    --         require("everybody-wants-that-line").setup({
    --             filename = {
    --                 enabled = false,
    --             },
    --         })
    --     end,
    -- })
    use({
        "SmiteshP/nvim-navic",
        requires = "neovim/nvim-lspconfig",
    })
    use({
        "X3eRo0/winbar.nvim",
        requires = "SmiteshP/nvim-navic",
        config = "require('winbar-config')",
    })
    use({
        "vim-utils/vim-man",
    })
    use({
        "ej-shafran/compile-mode.nvim",
        branch = "latest",
        -- or a specific version:
        -- tag = "v2.0.0"
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "m00qek/baleia.nvim", tag = "v1.3.0" },
        },
        config = "require('compile_mode')",
    })

    -- Colorschemes
    -- Tokyodark
    use({
        "tiagovla/tokyodark.nvim",
        config = "require('colorscheme-config')",
    })
    -- Paper color - slim
    use({
        "pappasam/papercolor-theme-slim",
        config = "require('colorscheme-config')",
    })

    use({
        "X3eRo0/papercolor-theme",
        config = "require('colorscheme-config')",
    })
    -- Tokyonight
    use({
        "folke/tokyonight.nvim",
        config = "require('colorscheme-config')",
    })

    -- Material
    use({
        "marko-cerovac/material.nvim",
        config = "require('colorscheme-config')",
    })

    -- Catppuccin
    use({
        "catppuccin/nvim",
        as = "catppuccin",
        config = "require('colorscheme-config')",
    })

    -- Vscode
    use({
        "Mofiqul/vscode.nvim",
        config = function()
            -- -- For dark theme
            -- vim.g.vscode_style = "dark"
            -- -- For light theme
            -- vim.g.vscode_style = "light"
            -- -- Enable transparent background
            -- vim.g.vscode_transparent = 1
            -- -- Enable italic comment
            -- vim.g.vscode_italic_comment = 1
            -- -- Disable nvim-tree background color
            -- vim.g.vscode_disable_nvimtree_bg = true
            -- vim.cmd("colorscheme vscode")
        end,
    })

    -- Vim Nightfly
    use({
        "bluz71/vim-nightfly-guicolors",
        config = function()
            -- vim.cmd("colorscheme nightfly")
        end,
    })

    -- Moonfly
    use({
        "bluz71/vim-moonfly-colors",
        config = function()
            -- vim.cmd("colorscheme moonfly")
        end,
    })

    -- Zephyr
    use({
        "glepnir/zephyr-nvim",
        config = function()
            -- vim.cmd("colorscheme zephyr")
        end,
    })

    -- Omni
    use({
        "yonlu/omni.vim",
        config = function()
            -- vim.cmd("colorscheme omni")
        end,
    })

    -- Rose Pine
    use({
        "rose-pine/neovim",
        as = "rose-pine",
        config = "require('colorscheme-config')",
    })

    -- Sonokai
    use({
        "sainnhe/sonokai",
        config = function()
            vim.g.sonokai_style = "andromeda"
            vim.g.sonokai_enable_italic = 0
            vim.g.sonokai_disable_italic_comment = 0
            -- vim.cmd("colorscheme sonokai")
        end,
    })

    -- UwU
    use({
        "mangeshrex/uwu.vim",
        config = "require('colorscheme-config')",
    })

    use({
        "projekt0n/github-nvim-theme",
        config = "require('colorscheme-config')",
    })

    -- use({
    --     "hawier-dev/hollow.vim",
    --     config = "require('colorscheme-config')",
    -- })

    use({
        "rockerBOO/boo-colorscheme-nvim",
        config = "require('colorscheme-config')",
    })

    use({
        "nyoom-engineering/oxocarbon.nvim",
        config = "require('colorscheme-config')",
    })
    use({
        "ishan9299/modus-theme-vim",
    })
    use({
        "Th3Whit3Wolf/one-nvim",
    })
    use({
        "rebelot/kanagawa.nvim",
    })
    use({ "metalelf0/jellybeans-nvim", requires = "rktjmp/lush.nvim" })
    use({ "daltonmenezes/aura-theme" })
    use({ "dasupradyumna/midnight.nvim" })

    -- use({
    --     "RaafatTurki/hex.nvim", config="require('hex').setup()"
    -- })
    if packer_bootstrap then
        require("packer").sync()
    end
end)
