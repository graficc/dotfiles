local M = {}

-- Gruvbox-material
M.gruvbox_material = function()
    vim.g.gruvbox_material_enable_bold = 1
    vim.g.gruvbox_material_enable_italic = 1
    vim.g.gruvbox_material_better_performance = 1
end

-- Edge
M.edge = function()
    vim.g.edge_enable_italic = 1
    vim.g.edge_better_performance = 1
end

-- Sonokai
M.sonokai = function()
    vim.g.sonokai_enable_italic = 1
    vim.g.sonokai_better_performance = 1
end

-- Indentline
M.indentline = function()
    require('indent_blankline').setup({
        char = '▏',
        show_first_indent_level = false,
        show_current_context = true,
        use_treesitter = true,
        filetype_exclude = { 'markdown', 'packer', 'startify', 'help' },
    })
end

-- Autopairs
M.autopairs = function()
    require('nvim-autopairs').setup({})
    require('nvim-autopairs.completion.cmp').setup({
        map_cr = true,
        map_complete = true,
        auto_select = true,
    })
end

return M
