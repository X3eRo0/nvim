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

require("lazy").setup({ -- Packer can manage itself
    { "wbthomason/packer.nvim" },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = "BufWinEnter",
        config = function()
            require("treesitter-config")
        end,
    },

    { "kyazdani42/nvim-web-devicons" },

    {
        "onsails/lspkind.nvim",
    },

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

    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-vsnip" },
    { "hrsh7th/vim-vsnip" },
    { "hrsh7th/vim-vsnip-integ" },
    { "rafamadriz/friendly-snippets" },
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer-config")
        end,
        event = "BufRead",
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns-config")
        end,
        event = "BufReadPre",
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
    { "monaqa/dial.nvim" },
    {
        "lukas-reineke/indent-blankline.nvim",
        commit = "3ad57e569d1c47cf4fa2308f555003e0a5509204",
        config = function()
            require("blankline-config")
        end,
        event = "BufRead",
    },

    {
        "mhartington/formatter.nvim",
        config = function()
            require("format-config")
        end,
        event = "VimEnter",
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

    {
        "fedepujol/move.nvim",
    },

    {
        "famiu/bufdelete.nvim",
    },

    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            require("lsp")
        end,
    },

    {
        "x3ero0/dired.nvim",
        dependencies = { "MunifTanjim/nui.nvim" },
        config = function()
            require("dired-config")
        end,
    },

    {
        "nvim-lua/plenary.nvim",
    },
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

    {
        "vim-utils/vim-man",
    },

    -- {
    --     "shoumodip/compile.nvim",
    -- },

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
            require("compile_mode")
        end,
    },

    {
        "RaafatTurki/hex.nvim",
        config = function()
            require("hex").setup()
        end,
    },

    -- Colorschemes
    -- Tokyodark
    {
        "tiagovla/tokyodark.nvim",
    },
    -- Paper color - slim
    {
        "pappasam/papercolor-theme-slim",
    },

    {
        "X3eRo0/papercolor-theme",
    },

    -- Tokyonight
    {
        "folke/tokyonight.nvim",
    },

    -- Material
    {
        "marko-cerovac/material.nvim",
    },

    -- Catppuccin
    {
        "catppuccin/nvim",
        name = "catppuccin",
    },

    -- Vscode
    {
        "Mofiqul/vscode.nvim",
    },

    -- Vim Nightfly
    {
        "bluz71/vim-nightfly-guicolors",
    },

    -- Moonfly
    {
        "bluz71/vim-moonfly-colors",
    },

    -- Zephyr
    {
        "glepnir/zephyr-nvim",
    },

    -- Omni
    {
        "yonlu/omni.vim",
    },

    -- Rose Pine
    {
        "rose-pine/neovim",
        name = "rose-pine",
    },

    -- Sonokai
    {
        "sainnhe/sonokai",
    },

    -- UwU
    {
        "mangeshrex/uwu.vim",
    },

    {
        "projekt0n/github-nvim-theme",
    },

    {
        "rockerBOO/boo-colorscheme-nvim",
    },

    {
        "nyoom-engineering/oxocarbon.nvim",
    },
    {
        "ishan9299/modus-theme-vim",
    },
    {
        "Th3Whit3Wolf/one-nvim",
    },
    {
        "rebelot/kanagawa.nvim",
    },
    { "metalelf0/jellybeans-nvim", dependencies = { "rktjmp/lush.nvim" } },
    { "daltonmenezes/aura-theme" },
    { "dasupradyumna/midnight.nvim" },
})
