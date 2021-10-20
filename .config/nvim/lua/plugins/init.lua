vim.cmd([[ packadd packer.nvim ]])

-- Auto PackerCompile
vim.api.nvim_exec(
    [[
    augroup Packer
        autocmd!
        autocmd BufWritePost init.lua PackerCompile
    augroup end
]],
    false
)

require('packer').startup(function(use)
    -- Packer
    use({ 'wbthomason/packer.nvim', opt = true })

    -- Speed up loading lua modules
    use({ 'lewis6991/impatient.nvim', opt = true })

    -- Devicons
    use({ 'kyazdani42/nvim-web-devicons', event = 'VimEnter' })

    -- Colorscheme
    use({
        'sainnhe/gruvbox-material',
        after = 'nvim-web-devicons',
        setup = function()
            require('plugins.settings').gruvbox_material()
        end,
        config = function()
            vim.cmd([[ colorscheme gruvbox-material ]])
        end,
        disable = true,
    })
    use({
        'sainnhe/sonokai',
        after = 'nvim-web-devicons',
        setup = function()
            require('plugins.settings').sonokai()
        end,
        config = function()
            vim.cmd([[ colorscheme sonokai ]])
        end,
        disable = true,
    })
    use({
        'sainnhe/edge',
        after = 'nvim-web-devicons',
        setup = function()
            require('plugins.settings').edge()
        end,
        config = function()
            vim.cmd([[ colorscheme edge ]])
        end,
    })

    -- Vim-startify
    use({ 'mhinz/vim-startify', event = 'BufWinEnter' })

    -- Treesitter
    use({
        'nvim-treesitter/nvim-treesitter',
        branch = '0.5-compat',
        requires = {
            { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' },
            { 'romgrk/nvim-treesitter-context', after = 'nvim-treesitter' },
            { 'p00f/nvim-ts-rainbow', after = 'nvim-treesitter', event = 'BufRead' },
            { 'andymass/vim-matchup', after = 'nvim-treesitter', event = 'CursorMoved' },
        },
        event = 'BufRead',
        run = ':TSUpdate',
        config = function()
            require('plugins.treesitter')
        end,
    })
    -- blankline
    use({
        'lukas-reineke/indent-blankline.nvim',
        after = 'nvim-treesitter',
        config = function()
            require('plugins.settings').indentline()
        end,
    })

    -- LSP modules
    use({
        'neovim/nvim-lspconfig',
        after = 'lspsaga.nvim',
        config = function()
            require('plugins.lsp')
        end,
    })
    -- Better LSP actions
    use({
        'tami5/lspsaga.nvim',
        branch = 'nvim51',
        after = 'cmp-nvim-lsp',
    })
    -- Signature
    use({ 'ray-x/lsp_signature.nvim', after = 'cmp-nvim-lsp' })

    -- Snippets
    use({ 'rafamadriz/friendly-snippets', event = 'InsertEnter' })
    use({
        'hrsh7th/vim-vsnip',
        requires = {
            {
                'hrsh7th/vim-vsnip-integ',
                after = 'friendly-snippets',
            },
        },
        after = 'friendly-snippets',
    })

    -- Completion
    use({ 'onsails/lspkind-nvim', after = 'friendly-snippets' })
    use({
        'hrsh7th/nvim-cmp',
        after = 'lspkind-nvim',
        requires = {
            {
                'hrsh7th/cmp-nvim-lsp',
                event = { 'BufReadPost', 'BufNewFile' },
            },
            { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
            { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
            { 'hrsh7th/cmp-vsnip', after = 'nvim-cmp' },
            { 'uga-rosa/cmp-dictionary', after = 'nvim-cmp' },
        },
        config = function()
            require('plugins.cmp')
        end,
    })
    -- Autopairs
    use({
        'windwp/nvim-autopairs',
        after = 'nvim-cmp',
        config = function()
            require('plugins.settings').autopairs()
        end,
    })

    -- Code format
    use({ 'sbdchd/neoformat', cmd = 'Neoformat' })

    -- Comment
    use({ 'b3nj5m1n/kommentary', event = 'CursorMoved' })

    -- Easymotion-like
    use({
        'phaazon/hop.nvim',
        cmd = 'HopChar2',
        config = function()
            require('hop').setup()
        end,
    })

    -- Better-escape.nvim
    use({
        'max397574/better-escape.nvim',
        event = 'InsertEnter',
        config = function()
            require('better_escape').setup()
        end,
    })

    -- Fcitx.vim
    use({
        'lilydjwg/fcitx.vim',
        event = 'InsertEnter',
        setup = function()
            vim.g.fcitx5_remote = '/usr/bin/fcitx5-remote'
        end,
    })

    -- Neoscroll
    use({
        'karb94/neoscroll.nvim',
        event = 'CursorMoved',
        config = function()
            require('neoscroll').setup()
        end,
    })

    -- True-zen
    use({
        'Pocco81/TrueZen.nvim',
        cmd = 'TZAtaraxis',
        config = function()
            require('true-zen').setup({})
        end,
    })

    -- Startup time
    use({
        'dstein64/vim-startuptime',
        cmd = 'StartupTime',
        config = function()
            vim.g.startuptime_tries = 10
        end,
    })
end)

require('plugins.mappings')
