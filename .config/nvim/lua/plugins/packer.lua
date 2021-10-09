vim.cmd([[ autocmd BufWritePost packer.lua PackerCompile ]])

require('packer').startup(function()
    local use = require('packer').use

    use('wbthomason/packer.nvim')

    use('sainnhe/edge')

    use('vim-airline/vim-airline')
    use('vim-airline/vim-airline-themes')
    use('mhinz/vim-startify')
    use('ryanoasis/vim-devicons')

    use({
        'nvim-treesitter/nvim-treesitter',
        requires = {
            'nvim-treesitter/nvim-treesitter-textobjects',
            'romgrk/nvim-treesitter-context',
            'p00f/nvim-ts-rainbow',
            'andymass/vim-matchup',
        },
        run = ':TSUpdate',
    })

    use('karb94/neoscroll.nvim')

    use('lukas-reineke/indent-blankline.nvim')

    use({
        'neovim/nvim-lspconfig',
        'onsails/lspkind-nvim',
        'ray-x/lsp_signature.nvim',
    })

    use({
        'L3MON4D3/LuaSnip',
        'rafamadriz/friendly-snippets',
    })

    use({
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'saadparwaiz1/cmp_luasnip',
        },
    })

    use('windwp/nvim-autopairs')

    use({ 'lilydjwg/fcitx.vim', event = 'InsertEnter' })

    use('sbdchd/neoformat')
    use('phaazon/hop.nvim')
    use('b3nj5m1n/kommentary')
    use('yianwillis/vimcdoc')
    use('dstein64/vim-startuptime')
end)
