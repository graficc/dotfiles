local M = {}

-- Onedarkpro
M.onedark_pro = function()
    local onedarkpro = require('onedarkpro')
    onedarkpro.setup({
        styles = {
            strings = 'bold',
            comments = 'italic',
            keywords = 'italic',
            functions = 'bold,italic',
            variables = 'NONE',
        },
    })
    onedarkpro.load()
end

-- Gruvbox-material
M.gruvbox_material = function()
    vim.g.gruvbox_material_show_eob = 1
    vim.g.gruvbox_material_enable_bold = 1
    vim.g.gruvbox_material_enable_italic = 1
end

-- Edge
M.edge = function()
    vim.g.edge_show_eob = 1
    vim.g.edge_enable_italic = 1
end

-- Sonokai
M.sonokai = function()
    vim.g.sonokai_show_eob = 1
    vim.g.sonokai_enable_italic = 1
end

-- Indentline
M.indentline = function()
    require('indent_blankline').setup({
        char = '▏',
        context_char = '▏',
        show_first_indent_level = false,
        show_current_context = true,
        use_treesitter = true,
        filetype_exclude = { 'markdown', 'packer', 'alpha', 'help' },
    })
end

-- LuaSnip
M.LuaSnip = function()
    require('luasnip').config.set_config({
        history = true,
        updateevents = 'TextChanged,TextChangedI',
    })
    require('luasnip/loaders/from_vscode').load()
end

-- Autopairs
M.autopairs = function()
    require('nvim-autopairs').setup({})
    require('cmp').event:on(
        'confirm_done',
        require('nvim-autopairs.completion.cmp').on_confirm_done({ map_char = { tex = '' } })
    )
end

return M
