vim.g.mapleader = [[ ]]

vim.cmd('filetype plugin indent on')
vim.cmd('syntax enable')

vim.cmd([[
augroup bufs
    autocmd!
    autocmd BufReadPost *
        \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
        \ |   exe "normal! g`\""
        \ | endif
    autocmd BufWritePre * :%s/\s\+$//e
augroup END
]])

vim.cmd([[
augroup yank
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
augroup END
]])

vim.opt.history = 500
vim.opt.completeopt = 'menu,menuone,noselect'
vim.opt.shortmess:append('c')
vim.opt.clipboard:append('unnamedplus')
vim.opt.diffopt:append('internal,algorithm:patience')
vim.opt.autoread = true
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.wildmenu = true
vim.opt.ruler = true
vim.opt.hidden = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 7
vim.opt.laststatus = 2
vim.opt.cmdheight = 1
vim.opt.backspace = 'eol,start,indent'
vim.opt.signcolumn = 'yes'

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.lazyredraw = true
vim.opt.magic = true
vim.opt.showmatch = true
vim.opt.mat = 2

vim.opt.errorbells = false
vim.opt.visualbell = false
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 100
vim.opt.updatetime = 300

vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.encoding = 'utf-8'
vim.opt.fileformats = 'unix,dos,mac'
vim.opt.formatoptions:append('j')

vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.linebreak = true
vim.opt.textwidth = 500
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = true
vim.opt.whichwrap:append('<,>,h,l')

vim.api.nvim_set_keymap('n', '0', '^', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader><CR>', '<cmd>nohl<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>w', '<cmd>w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>q', '<cmd>q<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-W>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-W>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-h>', '<C-W>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-W>l', { noremap = true })

