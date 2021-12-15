return require("packer").startup(
    function(use)
        -- Packer can manage itself
        use {"wbthomason/packer.nvim"}
        use {
            "tiagovla/tokyodark.nvim",
            config = "vim.cmd('colorscheme rose-pine')"
        }
        use {
            "marko-cerovac/material.nvim",
            config = function()
                -- Options (see available options below)
                -- vim.g.material_style = "darker"
                -- Load colorscheme after options
                -- vim.cmd("colorscheme material")
            end
        }

        use {"mangeshrex/uwu.vim"}

        use {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
            event = "BufWinEnter",
            config = "require('treesitter-config')"
        }

        use {
            "hoob3rt/lualine.nvim"
            -- requires = {"kyazdani42/nvim-web-devicons", opt = true},
            -- event = "BufWinEnter",
            -- config = "require('lualine-config')"
        }

        use {
            "akinsho/bufferline.nvim",
            requires = "kyazdani42/nvim-web-devicons",
            event = "BufWinEnter",
            config = "require('bufferline-config')"
        }

        use {
            "kyazdani42/nvim-tree.lua",
            requires = "kyazdani42/nvim-web-devicons"
        }

        use {
            "windwp/nvim-ts-autotag",
            after = "nvim-treesitter"
        }

        use {
            "p00f/nvim-ts-rainbow",
            after = "nvim-treesitter"
        }

        use {
            "windwp/nvim-autopairs",
            config = "require('autopairs-config')",
            after = "nvim-cmp"
        }
        use {
            "nvim-telescope/telescope.nvim",
            requires = {"nvim-lua/plenary.nvim"},
            cmd = "Telescope",
            config = "require('telescope-config')"
        }

        use {
            "neovim/nvim-lspconfig",
            config = "require('lsp')"
        }

        use {"hrsh7th/cmp-nvim-lsp"}
        use {"hrsh7th/cmp-buffer"}
        use {"hrsh7th/cmp-path"}
        use {"hrsh7th/nvim-cmp"}
        use {"hrsh7th/cmp-vsnip"}
        use {"hrsh7th/vim-vsnip"}
        use {"hrsh7th/vim-vsnip-integ"}
        use {"rafamadriz/friendly-snippets"}
        use {"onsails/lspkind-nvim"}
        use {
            "norcalli/nvim-colorizer.lua",
            config = "require('colorizer-config')",
            event = "BufRead"
        }
        use {
            "lewis6991/gitsigns.nvim",
            requires = {
                "nvim-lua/plenary.nvim"
            },
            config = function()
                require("gitsigns").setup {
                    current_line_blame = true,
                    signcolumn = true,
                    numhl = true
                }
            end
        }
        use {"tpope/vim-surround"}
        use {
            "terrortylor/nvim-comment"
        }
        use {
            "windwp/nvim-spectre",
            config = "require('spectre-config')"
        }
        use {"monaqa/dial.nvim"}
        use {
            "lukas-reineke/indent-blankline.nvim",
            config = "require('blankline-config')",
            event = "BufRead"
        }
        use(
            {
                "rose-pine/neovim",
                as = "rose-pine",
                config = function()
                    -- Options (see available options below)
                    vim.g.rose_pine_variant = "base"

                    -- Load colorscheme after options
                    -- vim.cmd("colorscheme rose-pine")
                end
            }
        )
        use {
            "mhartington/formatter.nvim",
            config = "require('format-config')",
            cmd = "Format"
        }
        use {"tami5/lspsaga.nvim"}
        use {
            "akinsho/toggleterm.nvim",
            config = "require('toggleterm-config')"
        }
        use {
            "glepnir/galaxyline.nvim",
            branch = "main",
            event = "BufWinEnter",
            -- your statusline
            config = "require('galaxyline-config')",
            -- some optional icons
            requires = {"kyazdani42/nvim-web-devicons", opt = true}
        }
        use {
            "andweeb/presence.nvim",
            config = function()
                require("presence"):setup(
                    {
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
                        line_number_text = "Line %s out of %s"
                    }
                )
            end
        }
    end
)
