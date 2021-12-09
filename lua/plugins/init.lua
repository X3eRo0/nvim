return require("packer").startup(
    function(use)
        -- Packer can manage itself
        use {"wbthomason/packer.nvim"}
        use {"tiagovla/tokyodark.nvim", config = "vim.cmd('colorscheme rose-pine')"}
        use {"marko-cerovac/material.nvim"}
        use {"mangeshrex/uwu.vim"}

        use {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
            event = "BufWinEnter",
            config = "require('treesitter-config')"
        }

        use {
            "hoob3rt/lualine.nvim",
            requires = {"kyazdani42/nvim-web-devicons", opt = true},
            event = "BufWinEnter",
            config = "require('lualine-config')"
        }

        use {
            "akinsho/bufferline.nvim",
            requires = "kyazdani42/nvim-web-devicons",
            event = "BufWinEnter",
            config = "require('bufferline-config')"
        }

        use {
            "kyazdani42/nvim-tree.lua",
            requires = "kyazdani42/nvim-web-devicons",
        }

        use {
            "windwp/nvim-ts-autotag",
            event = "InsertEnter",
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
                require("gitsigns").setup {current_line_blame = true, signcolumn = false}
            end
        }
        use {"tpope/vim-surround"}
        use {
            "terrortylor/nvim-comment",
            config="require('comment-config')",
            cmd="CommentToggle"
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
                    vim.cmd("colorscheme rose-pine")
                end
            }
        )
        use {
            "mhartington/formatter.nvim",
            config = "require('format-config')",
            cmd = "Format"
        }
        use {"RishabhRD/popfix"}
        use {"RishabhRD/nvim-lsputils"}
        use {
            "weilbith/nvim-code-action-menu",
            cmd = "CodeActionMenu"
        }
        use {
            "akinsho/toggleterm.nvim",
            config = "require('toggleterm-config')"
        }
    end
)
