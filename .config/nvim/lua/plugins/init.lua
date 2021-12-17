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

-- Packer init
local packer = require('packer')
packer.init({
    compile_path = vim.fn.stdpath('config') .. '/lua/packer_compiled.lua',
})

packer.startup(function(use)
    -- Packer
    use({ 'wbthomason/packer.nvim', opt = true })

    -- Speed up loading lua modules
    use({ 'lewis6991/impatient.nvim', opt = true })

    -- Speed up loading filetype.vim
    use({ 'nathom/filetype.nvim' })

    -- Colorscheme
    use({
        'olimorris/onedarkpro.nvim',
        event = 'VimEnter',
        config = function()
            require('plugins.settings').onedark_pro()
        end,
        disable = true,
    })
    use({
        'sainnhe/gruvbox-material',
        event = 'VimEnter',
        config = function()
            require('plugins.settings').gruvbox_material()
            vim.cmd([[ colorscheme gruvbox-material ]])
        end,
        disable = true,
    })
    use({
        'sainnhe/sonokai',
        event = 'VimEnter',
        config = function()
            require('plugins.settings').sonokai()
            vim.cmd([[ colorscheme sonokai ]])
        end,
        disable = true,
    })
    use({
        'sainnhe/edge',
        event = 'VimEnter',
        config = function()
            require('plugins.settings').edge()
            vim.cmd([[ colorscheme edge ]])
        end,
    })

    -- Statusline
    use({
        'nvim-lualine/lualine.nvim',
        after = 'lualine-lsp-progress',
        requires = {
            { 'kyazdani42/nvim-web-devicons' },
            { 'arkav/lualine-lsp-progress', event = 'BufReadPost' },
        },
        config = function()
            require('plugins.statusline')
        end,
    })

    -- Alpha-nvim
    use({
        'goolord/alpha-nvim',
        event = 'BufWinEnter',
        config = function()
            require('alpha').setup(require('alpha.themes.startify').opts)
        end,
    })

    -- Treesitter
    use({
        'nvim-treesitter/nvim-treesitter',
        requires = {
            { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' },
            { 'romgrk/nvim-treesitter-context', after = 'nvim-treesitter' },
            { 'p00f/nvim-ts-rainbow', event = 'BufRead' },
            { 'andymass/vim-matchup', event = 'BufRead' },
        },
        event = 'BufReadPost',
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
        requires = {
            { 'ray-x/lsp_signature.nvim', after = 'cmp-nvim-lsp' },
            { 'tami5/lspsaga.nvim', after = 'lsp_signature.nvim' },
        },
        config = function()
            require('plugins.lsp').clangd()
            require('plugins.lsp').sumneko_lua()
        end,
    })

    -- Snippets
    use({
        'L3MON4D3/LuaSnip',
        after = 'friendly-snippets',
        requires = {
            { 'rafamadriz/friendly-snippets', event = 'InsertEnter' },
        },
        config = function()
            require('plugins.settings').LuaSnip()
        end,
    })

    -- Completion
    use({
        'hrsh7th/nvim-cmp',
        after = 'lspkind-nvim',
        requires = {
            { 'hrsh7th/cmp-nvim-lsp', event = { 'BufRead', 'BufNewFile' } },
            { 'onsails/lspkind-nvim', after = 'LuaSnip' },
            { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
            { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
            { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
            { 'octaltree/cmp-look', after = 'nvim-cmp' },
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
    use({ 'b3nj5m1n/kommentary' })

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
        config = function()
            require('neoscroll').setup()
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

    -- Vimcdoc
    use({ 'yianwillis/vimcdoc' })
end)

require('plugins.mappings')
