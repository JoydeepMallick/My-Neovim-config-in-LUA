------------------------------------------------------------------
-- 
-- As a reference read the blog below :-
-- https://wiki.nikiv.dev/text-editors/vim/vim-plugins
--
------------------------------------------------------------------

local status, packer = pcall(require, 'packer')
if(not status) then
    print("Packer is not installed")
    return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)

    -- packer can manage itself🤨
    use 'wbthomason/packer.nvim'


    -- telescope file finder
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }


    -- Configurations for Nvim LSP ZERO
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},         -- Required
            {'hrsh7th/cmp-nvim-lsp'},     -- Required
            {'hrsh7th/cmp-buffer'},       -- Optional
            {'hrsh7th/cmp-path'},         -- Optional
            {'saadparwaiz1/cmp_luasnip'}, -- Optional
            {'hrsh7th/cmp-nvim-lua'},     -- Optional

            -- Snippets
            {'L3MON4D3/LuaSnip'},             -- Required
            {'rafamadriz/friendly-snippets'}, -- Optional
        }
    }

    -- all possible colorschemes
    use('flazz/vim-colorschemes')
    use('morhetz/gruvbox')
    use('lifepillar/vim-gruvbox8')
    use('muellan/am-colors')
    use('EdenEast/nightfox.nvim')
    use('connorholyday/vim-snazzy')
    use('veloce/vim-aldmeris')
    use('noahfrederick/vim-noctu')
    use('ajmwagar/vim-deus')
    -- to install gitlab files read this :- https://github.com/wbthomason/packer.nvim/issues/858
    use{
        'https://gitlab.com/protesilaos/tempus-themes-vim.git',
        as = 'tempus-themes-vim.git'
    }
    -- rosepine theme as recommended by Primegan🌹🌲
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            require("rose-pine").setup()
            vim.cmd('colorscheme rose-pine')
        end
    })

    -- install treesitter for better highlighting and indentation in a much faster way
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})


    -- quickly undo changes using undotree, easier to manage different versions of a program like git
    use('mbbill/undotree')


    -- git integration in neovim
    use('tpope/vim-fugitive')


    -- auto pairs plugin
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    -- multicursor plugin 
    use('terryma/vim-multiple-cursors')


    -- lualine statusbar
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- improved load time of nvim by using cache memory.
    use 'lewis6991/impatient.nvim'


    -- beautiful startup screen
    use {
        "startup-nvim/startup.nvim",
        requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
        config = function()
            require"startup".setup()
         end
    }

    -- make windows transparent or opaque as per need if its supported
    use('xiyaowong/nvim-transparent')

    -- automatically highlighting other uses of the word under the cursor using either LSP, Tree-sitter, or regex matching.
    use('RRethy/vim-illuminate')

    -- commenter plugin
    use "terrortylor/nvim-comment"
    require('nvim_comment').setup()

    -- nvim-tree file explorer
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    -- nvim-surround, similar to tpope surround written in lua
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })

    -- live server plugin but ensure live-server is installed via node for it to work
    use {
        'barrett-ruth/live-server.nvim',
        require('live-server').setup(opt)
    }

end)
