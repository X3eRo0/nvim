local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufWinEnter" },
        config = function()
            require("treesitter-config")
        end,
    },
    "kyazdani42/nvim-web-devicons",
    "onsails/lspkind.nvim",
    {
        "windwp/nvim-autopairs",
        config = function()
            require("autopairs-config")
        end,
        dependencies = "nvim-cmp",
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        cmd = "Telescope",
        config = function()
            require("telescope-config")
        end,
    },
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-vsnip",
    "hrsh7th/vim-vsnip",
    "hrsh7th/vim-vsnip-integ",
    "rafamadriz/friendly-snippets",
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns-config")
        end,
        event = { "BufReadPre" },
    },
    {
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup()
        end,
    },
    {
        "numToStr/Comment.nvim",
        config = function()
            require("comment-config")
        end,
    },
    -- {
    --     "lukas-reineke/indent-blankline.nvim",
    --     commit = "3ad57e569d1c47cf4fa2308f555003e0a5509204",
    --     config = function()
    --         require("blankline-config")
    --     end,
    --     event = { "BufRead" },
    -- },
    {
        "akinsho/toggleterm.nvim",
        config = function()
            require("toggleterm-config")
        end,
    },
    "famiu/bufdelete.nvim",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("lsp")
        end,
    },
    {
        "x3ero0/dired.nvim",
        -- dir = "/home/x3ero0/dired.nvim",
        name = "dired.nvim",
        dependencies = { "MunifTanjim/nui.nvim" },
        config = function()
            require("dired-config")
        end,
    },
    {
        "stevearc/oil.nvim",
        ---@module 'oil'
        ---@type oil.SetupOpts
        enabled = false,
        opts = {},
        -- Optional dependencies
        dependencies = { { "echasnovski/mini.icons", opts = {} } },
        -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
        config = function()
            require("oil-config")
        end,
    },
    "nvim-lua/plenary.nvim",
    {
        "TimUntersberger/neogit",
        branch = "master",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
        },
        config = function()
            require("neogit-config")
        end,
    },
    -- {
    --     "SmiteshP/nvim-navic",
    --     dependencies = { "neovim/nvim-lspconfig" },
    --     config = function()
    --         require("navic-config")
    --     end,
    -- },

    -- {
    --     "X3eRo0/winbar.nvim",
    --     dependencies = { "SmiteshP/nvim-navic" },
    --     config = function()
    --         require("winbar-config")
    --     end,
    -- },
    "vim-utils/vim-man",
    {
        "mhartington/formatter.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("formatter-config")
        end,
    },

    -- Colorscheme
    {
        enabled = false,
        "tiagovla/tokyodark.nvim",
        priority = 1000,
        config = function()
            require("colorscheme-config")
        end,
    },
    {
        enabled = false,
        "pappasam/papercolor-theme-slim",
        priority = 1000,
        config = function()
            require("colorscheme-config")
        end,
    },
    {
        enabled = false,
        "X3eRo0/papercolor-theme",
        priority = 1000,
        config = function()
            require("colorscheme-config")
        end,
    },
    {
        enabled = false,
        "folke/tokyonight.nvim",
        priority = 1000,
        config = function()
            require("colorscheme-config")
        end,
    },
    {
        enabled = false,
        "marko-cerovac/material.nvim",
        priority = 1000,
        config = function()
            require("colorscheme-config")
        end,
    },
    {
        enabled = false,
        "Mofiqul/vscode.nvim",
        priority = 1000,
        config = function()
            require("colorscheme-config")
        end,
    },
    {
        enabled = false,
        "bluz71/vim-nightfly-guicolors",
        priority = 1000,
        config = function()
            require("colorscheme-config")
        end,
    },
    {
        enabled = false,
        "bluz71/vim-moonfly-colors",
        priority = 1000,
        config = function()
            require("colorscheme-config")
        end,
    },
    {
        enabled = false,
        "nvimdev/zephyr-nvim",
        priority = 1000,
        config = function()
            require("colorscheme-config")
        end,
    },
    {
        enabled = false,
        "yonlu/omni.vim",
        priority = 1000,
        config = function()
            require("colorscheme-config")
        end,
    },
    {
        enabled = false,
        "sainnhe/sonokai",
        priority = 1000,
        config = function()
            require("colorscheme-config")
        end,
    },
    {
        enabled = false,
        "Everblush/everblush.vim",
        priority = 1000,
        config = function()
            require("colorscheme-config")
        end,
    },
    {
        enabled = false,
        "projekt0n/github-nvim-theme",
        priority = 1000,
        config = function()
            require("colorscheme-config")
        end,
    },
    {
        enabled = false,
        "rockerBOO/boo-colorscheme-nvim",
        priority = 1000,
        config = function()
            require("colorscheme-config")
        end,
    },
    {
        enabled = false,
        "nyoom-engineering/oxocarbon.nvim",
        priority = 1000,
        config = function()
            require("colorscheme-config")
        end,
    },
    {
        enabled = false,
        "ishan9299/modus-theme-vim",
        priority = 1000,
        config = function()
            require("colorscheme-config")
        end,
    },
    {
        enabled = false,
        "Th3Whit3Wolf/one-nvim",
        priority = 1000,
        config = function()
            require("colorscheme-config")
        end,
    },
    {
        enabled = false,
        "rebelot/kanagawa.nvim",
        priority = 1000,
        config = function()
            require("colorscheme-config")
        end,
    },
    {
        enabled = false,
        "techtuner/aura-neovim",
        priority = 1000,
        config = function()
            require("colorscheme-config")
        end,
    },
    {
        enabled = false,
        "dasupradyumna/midnight.nvim",
        config = function()
            require("colorscheme-config")
        end,
    },
    {
        enabled = false,
        "rose-pine/neovim",
        name = "rose-pine",
        priority = 1000,
        config = function()
            require("colorscheme-config")
        end,
    },
    {
        enabled = false,
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("colorscheme-config")
        end,
    },
    {
        enabled = false,
        "wadackel/vim-dogrun",
        priority = 1000,
        config = function()
            require("colorscheme-config")
        end,
    },
    {
        enabled = false,
        "HoNamDuong/hybrid.nvim",
        priority = 1000,
        config = function()
            require("colorscheme-config")
        end,
    },
    {
        enabled = false,
        "bettervim/yugen.nvim",
        priority = 1000,
        config = function()
            require("colorscheme-config")
        end,
    },
    {
        enabled = false,
        "slugbyte/lackluster.nvim",
        priority = 1000,
        config = function()
            require("colorscheme-config")
        end,
    },
    {
        enabled = false,
        "killitar/obscure.nvim",
        priority = 1000,
        config = function()
            require("colorscheme-config")
        end,
    },
    {
        enabled = false,
        "kanenorman/gruvbox-darker.nvim",
        priority = 1000,
        config = function()
            require("colorscheme-config")
        end,
    },
    {
        enabled = false,
        "CosecSecCot/midnight-desert.nvim",
        dependencies = {
            "rktjmp/lush.nvim",
        },
        priority = 1000,
        config = function()
            require("colorscheme-config")
        end,
    },
    {
        enabled = false,
        "anAcc22/sakura.nvim",
        priority = 1000,
        dependencies = {
            "rktjmp/lush.nvim",
        },
        config = function()
            require("colorscheme-config")
        end,
    },
    {
        enabled = false,
        "zenbones-theme/zenbones.nvim",
        dependencies = {
            "rktjmp/lush.nvim",
        },
        priority = 1000,
        config = function()
            require("colorscheme-config")
        end,
    },
    {
        enabled = false,
        "vague2k/vague.nvim",
        -- priority = 1000,
        config = function()
            require("vague").setup({
                colors = { comment = "#3a3a45" },
            })
            require("colorscheme-config")
        end,
    },
    {
        enabled = true,
        "blazkowolf/gruber-darker.nvim",
        config = function()
            require("colorscheme-config")
        end,
    },
    {
        enabled = false,
        "p00f/alabaster.nvim",
        config = function()
            require("colorscheme-config")
        end,
    },
}

local opts = {
    rocks = {
        enabled = false,
    },
}
require("lazy").setup(plugins, opts)
require("plugins.apply_patches").apply_patches()
