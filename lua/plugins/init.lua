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

local csc = require("colorscheme-config")

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
    {
        "williamboman/mason.nvim",
        dependencies = {
            "WhoIsSethDaniel/mason-tool-installer.nvim",
        },
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
        "tiagovla/tokyodark.nvim",
        cond = function()
            return csc.is_active("tokyodark")
        end,
        config = function()
            return csc.setup()
        end,
    },
    {
        "pappasam/papercolor-theme-slim",
        cond = function()
            return csc.is_active("PaperColorSlim")
        end,
        config = function()
            return csc.setup()
        end,
    },
    {
        "X3eRo0/papercolor-theme",
        cond = function()
            return csc.is_active("PaperColor")
        end,
        config = function()
            return csc.setup()
        end,
    },
    {
        "folke/tokyonight.nvim",
        cond = function()
            return csc.is_active("tokyonight")
        end,
        config = function()
            return csc.setup()
        end,
    },
    {
        "marko-cerovac/material.nvim",
        cond = function()
            return csc.is_active("material")
        end,
        config = function()
            return csc.setup()
        end,
    },
    {
        "Mofiqul/vscode.nvim",
        cond = function()
            return csc.is_active("vscode")
        end,
        config = function()
            return csc.setup()
        end,
    },
    {
        "bluz71/vim-nightfly-guicolors",
        cond = function()
            return csc.is_active("nightfly")
        end,
        config = function()
            return csc.setup()
        end,
    },
    {
        "bluz71/vim-moonfly-colors",
        cond = function()
            return csc.is_active("moonfly")
        end,
        config = function()
            return csc.setup()
        end,
    },
    {
        "nvimdev/zephyr-nvim",
        cond = function()
            return csc.is_active("zephyr")
        end,
        config = function()
            return csc.setup()
        end,
    },
    {
        "yonlu/omni.vim",
        cond = function()
            return csc.is_active("omni")
        end,
        config = function()
            return csc.setup()
        end,
    },
    {
        "sainnhe/sonokai",
        cond = function()
            return csc.is_active("sonokai")
        end,
        config = function()
            return csc.setup()
        end,
    },
    {
        "Everblush/everblush.vim",
        cond = function()
            return csc.is_active("everblush")
        end,
        config = function()
            return csc.setup()
        end,
    },
    {
        "projekt0n/github-nvim-theme",
        cond = function()
            return csc.is_active("github")
        end,
        config = function()
            return csc.setup()
        end,
    },
    {
        "rockerBOO/boo-colorscheme-nvim",
        cond = function()
            return csc.is_active("boo")
        end,
        config = function()
            return csc.setup()
        end,
    },
    {
        "nyoom-engineering/oxocarbon.nvim",
        cond = function()
            return csc.is_active("oxocarbon")
        end,
        config = function()
            return csc.setup()
        end,
    },
    {
        "ishan9299/modus-theme-vim",
        cond = function()
            return csc.is_active("modus")
        end,
        config = function()
            return csc.setup()
        end,
    },
    {
        "Th3Whit3Wolf/one-nvim",
        cond = function()
            return csc.is_active("one-nvim")
        end,
        config = function()
            return csc.setup()
        end,
    },
    {
        "rebelot/kanagawa.nvim",
        cond = function()
            return csc.is_active("kanagawa")
        end,
        config = function()
            return csc.setup()
        end,
    },
    {
        "techtuner/aura-neovim",
        cond = function()
            return csc.is_active("aura")
        end,
        config = function()
            return csc.setup()
        end,
    },
    {
        "dasupradyumna/midnight.nvim",
        cond = function()
            return csc.is_active("midnight")
        end,
        config = function()
            return csc.setup()
        end,
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        cond = function()
            return csc.is_active("rose-pine")
        end,
        config = function()
            return csc.setup()
        end,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        cond = function()
            return csc.is_active("catppuccin")
        end,
        config = function()
            return csc.setup()
        end,
    },
    {
        "wadackel/vim-dogrun",
        cond = function()
            return csc.is_active("dogrun")
        end,
        config = function()
            return csc.setup()
        end,
    },
    {
        "HoNamDuong/hybrid.nvim",
        cond = function()
            return csc.is_active("hybrid")
        end,
        config = function()
            return csc.setup()
        end,
    },
    {
        "bettervim/yugen.nvim",
        cond = function()
            return csc.is_active("yugen")
        end,
        config = function()
            return csc.setup()
        end,
    },
    {
        "slugbyte/lackluster.nvim",
        cond = function()
            return csc.is_active("lackluster")
        end,
        config = function()
            return csc.setup()
        end,
    },
    {
        "killitar/obscure.nvim",
        cond = function()
            return csc.is_active("obscure")
        end,
        config = function()
            return csc.setup()
        end,
    },
    {
        "kanenorman/gruvbox-darker.nvim",
        cond = function()
            return csc.is_active("gruvbox")
        end,
        config = function()
            return csc.setup()
        end,
    },
    {
        "CosecSecCot/midnight-desert.nvim",
        dependencies = {
            "rktjmp/lush.nvim",
        },
        cond = function()
            return csc.is_active("midnight-desert")
        end,
        config = function()
            return csc.setup()
        end,
    },
    {
        "anAcc22/sakura.nvim",
        dependencies = {
            "rktjmp/lush.nvim",
        },
        cond = function()
            return csc.is_active("sakura")
        end,
        config = function()
            return csc.setup()
        end,
    },
    {
        "zenbones-theme/zenbones.nvim",
        dependencies = {
            "rktjmp/lush.nvim",
        },
        cond = function()
            return csc.is_active("zenbones")
        end,
        config = function()
            return csc.setup()
        end,
    },
    {
        "vague2k/vague.nvim",
        cond = function()
            return csc.is_active("vague")
        end,
        config = function()
            return csc.setup()
        end,
    },
    {
        "blazkowolf/gruber-darker.nvim",
        cond = function()
            return csc.is_active("gruber-darker")
        end,
        config = function()
            return csc.setup()
        end,
    },
    {
        "p00f/alabaster.nvim",
        cond = function()
            return csc.is_active("alabaster")
        end,
        config = function()
            return csc.setup()
        end,
    },
    {
        "oneslash/helix-nvim",
        version = "*",
        cond = function()
            return csc.is_active("helix")
        end,
        config = function()
            return csc.setup()
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
