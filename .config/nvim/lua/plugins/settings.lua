-- edge
vim.g.edge_enable_italic = 1
vim.g.edge_disable_italic_comment = 1
vim.g.edge_better_performance = 1
vim.cmd([[ colorscheme edge ]])

-- vim-aireline
vim.g.webdevicons_enable_airline_statusline = 1
vim.g.airline_theme = 'edge'

-- vim-startify
vim.g.webdevicons_enable_startify = 1
vim.cmd([[
function! StartifyEntryFormat()
    return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction
]])

-- neoscroll
require('neoscroll').setup()

--	blankline
require('indent_blankline').setup({
    use_treesitter = true,
})

-- hop
require('hop').setup()
vim.api.nvim_set_keymap('n', '<Leader>s', '<cmd>HopChar2<CR>', { noremap = true })

-- neoformat
vim.api.nvim_set_keymap('n', '<Leader>fc', '<cmd>Neoformat<CR>', { noremap = true })
