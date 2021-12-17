-- Autocmds
-- Go to last position and trim whitespace
vim.api.nvim_exec(
    [[
    augroup Bufs
        autocmd!
        autocmd BufReadPost *
            \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
            \ |   exe "normal! g`\""
            \ | endif
        autocmd BufWritePre * :%s/\s\+$//e
    augroup end
]],
    false
)

-- Highlight on yank
vim.api.nvim_exec(
    [[
    augroup YankHighlight
        autocmd!
        autocmd TextYankPost * silent! lua vim.highlight.on_yank()
    augroup end
]],
    false
)

-- Variables
-- Leader keys
vim.g.mapleader = [[ ]]
vim.g.maplocalleader = [[,]]

-- Providers
vim.g.loaded_python_provider = 0
vim.g.python3_host_prog = '/usr/bin/python'
vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

-- Disable built-in plugins
vim.g.loaded_2html_plugin = 1
vim.g.loaded_gzip = 1
vim.g.loaded_man = 1
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_shada_plugin = 1
vim.g.loaded_spellfile_plugin = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_zipPlugin = 1

-- Options
vim.opt.breakindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.tabstop = 4

vim.opt.cmdheight = 1
vim.opt.hidden = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 7
vim.opt.sidescrolloff = 3
vim.opt.signcolumn = 'yes'

vim.opt.ignorecase = true
vim.opt.magic = true
vim.opt.showmatch = true
vim.opt.smartcase = true

vim.opt.linebreak = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true

vim.opt.clipboard:append('unnamed,unnamedplus')
vim.opt.dictionary:append('/usr/share/dict/words')
vim.opt.diffopt:append('internal,algorithm:patience')
vim.opt.shortmess:append('c')
vim.opt.completeopt = 'menu,menuone,noselect'
vim.opt.lazyredraw = true
vim.opt.undofile = true
vim.opt.updatetime = 250

-- Mappings
-- Behaviours
vim.api.nvim_set_keymap('n', '0', '^', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-CR>', '<cmd>nohl<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-w>', '<cmd>w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-q>', '<cmd>q<CR>', { noremap = true, silent = true })

-- Windows
vim.api.nvim_set_keymap('n', '<C-j>', '<C-W>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-W>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-h>', '<C-W>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-W>l', { noremap = true })
