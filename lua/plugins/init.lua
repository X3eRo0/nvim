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
        "windwp/nvim-ts-autotag",
        dependencies = { "nvim-treesitter" },
    },
    {
        "p00f/nvim-ts-rainbow",
        dependencies = { "nvim-treesitter" },
    },
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
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
        event = { "BufRead" },
    },
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
    "monaqa/dial.nvim",
    {
        "lukas-reineke/indent-blankline.nvim",
        commit = "3ad57e569d1c47cf4fa2308f555003e0a5509204",
        config = function()
            require("blankline-config")
        end,
        event = { "BufRead" },
    },
    {
        "nvimdev/lspsaga.nvim",
        dependencies = { "nvim-lspconfig" },
        config = function()
            require("lsp/lspsaga")
        end,
    },
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
        -- "x3ero0/dired.nvim",
        dir = "/home/x3ero0/dired.nvim",
        name = "dired.nvim",
        dependencies = { "MunifTanjim/nui.nvim" },
        config = function()
            require("dired-config")
        end,
    },
    "nvim-lua/plenary.nvim",
    {
        "TimUntersberger/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
        },
        config = function()
            require("neogit-config")
        end,
    },
    {
        "SmiteshP/nvim-navic",
        dependencies = { "neovim/nvim-lspconfig" },
    },

    -- {
    --     "X3eRo0/winbar.nvim",
    --     dependencies = {"SmiteshP/nvim-navic"},
    --     config = function()
    --     require('winbar-config')
    --     end,,
    -- })
    "vim-utils/vim-man",
    {
        "ej-shafran/compile-mode.nvim",
        branch = "latest",
        -- or a specific version:
        -- tag = "v2.0.0"
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            { "m00qek/baleia.nvim", tag = "v1.3.0" },
        },
        config = function()
            require("compile-config")
        end,
    },
    {
        "RaafatTurki/hex.nvim",
        config = function()
            require("hex").setup()
        end,
    },
    {
        "mhartington/formatter.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("formatter-config")
        end,
    },

    -- Colorschemes
    -- { enabled=false, "tiagovla/tokyodark.nvim", priority=1000},
    -- { enabled=false, "pappasam/papercolor-theme-slim", priority=1000},
    -- { enabled=false, "X3eRo0/papercolor-theme", priority=1000},
    -- { enabled=false, "folke/tokyonight.nvim", priority=1000},
    -- { enabled=false, "marko-cerovac/material.nvim", priority=1000},
    -- { enabled=false, "Mofiqul/vscode.nvim", priority=1000},
    -- { enabled=false, "bluz71/vim-nightfly-guicolors", priority=1000},
    -- { enabled=false, "bluz71/vim-moonfly-colors", priority=1000},
    -- { enabled=false, "nvimdev/zephyr-nvim", priority=1000},
    -- { enabled=false, "yonlu/omni.vim", priority=1000},
    -- { enabled=false, "sainnhe/sonokai", priority=1000},
    -- { enabled=false, "Everblush/everblush.vim"},
    -- { enabled = false, "projekt0n/github-nvim-theme", priority = 1000 },
    -- { enabled = false, "rockerBOO/boo-colorscheme-nvim", priority = 1000 },
    -- { enabled = false, "nyoom-engineering/oxocarbon.nvim", priority = 1000 },
    -- { enabled = false, "ishan9299/modus-theme-vim", priority = 1000 },
    -- { enabled = false, "Th3Whit3Wolf/one-nvim", priority = 1000 },
    -- { enabled = false, "rebelot/kanagawa.nvim", priority = 1000 },
    -- { enabled = false, "techtuner/aura-neovim", priority = 1000 },
    {
        enabled = true,
        "dasupradyumna/midnight.nvim",
        config = function()
            require("colorscheme-config")
        end,
    },
    -- {
    --     enabled = false,
    --     "rose-pine/neovim",
    --     name = "rose-pine",
    --     priority = 1000,
    -- },
    -- { enabled = false, "metalelf0/jellybeans-nvim", dependencies = { "rktjmp/lush.nvim" }, priority = 1000 },
    -- -- Catppuccin
    -- {
    --     enabled = false,
    --     "catppuccin/nvim",
    --     name = "catppuccin",
    --     priority = 1000,
    -- },
}

local opts = {}
require("lazy").setup(plugins, opts)
