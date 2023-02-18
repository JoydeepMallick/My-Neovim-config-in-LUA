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



end)
