return require('packer').startup(function(use)
    -- Packer can manage itself
    use {'wbthomason/packer.nvim'}
    use {'tiagovla/tokyodark.nvim'}
    use {'marko-cerovac/material.nvim'}
    use {'mangeshrex/uwu.vim'}
    use {'nvim-treesitter/nvim-treesitter', run = ":TSUpdate"}
    use {
      'hoob3rt/lualine.nvim',
      requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
    use {
      'kyazdani42/nvim-tree.lua',
      requires = 'kyazdani42/nvim-web-devicons'
    }
    use {'windwp/nvim-ts-autotag'}
    use {'p00f/nvim-ts-rainbow'}
    use {'windwp/nvim-autopairs'}
    use {'folke/which-key.nvim'}
    use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {'neovim/nvim-lspconfig'}
    use {'hrsh7th/cmp-nvim-lsp'}
    use {'hrsh7th/cmp-buffer'}
    use {'hrsh7th/cmp-path'}
    use {'hrsh7th/nvim-cmp'}
    use {'hrsh7th/cmp-vsnip'}
    use {'hrsh7th/vim-vsnip'}
    use {'onsails/lspkind-nvim'}
    use {'norcalli/nvim-colorizer.lua'}
    use {'glepnir/dashboard-nvim'}
    use {
      'lewis6991/gitsigns.nvim',
      requires = {
        'nvim-lua/plenary.nvim'
      },
      config = function()
        require('gitsigns').setup{current_line_blame = true, signcolumn = false}
      end
    }
    use {'brooth/far.vim'}
    use {'tpope/vim-surround'}
    use {
        'terrortylor/nvim-comment',
        require('nvim_comment').setup({
            marker_padding = true,
            comment_empty = false,
            create_mappings = true,
            line_mapping = "gcc",
        })
    }
    use {'nvim-lua/plenary.nvim'}
    use {'windwp/nvim-spectre'}
    use {'monaqa/dial.nvim'}
    use {'lukas-reineke/indent-blankline.nvim'}
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            -- Options (see available options below)
            vim.g.rose_pine_variant = 'base'

            -- Load colorscheme after options
            vim.cmd('colorscheme rose-pine')
        end
    })
    use {'mhartington/formatter.nvim'}
end)
