require('lualine').setup({
    options = {
        theme = 'onedark',
        section_separators = '',
        component_separators = '',
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff' },
        lualine_c = { 'filename', 'filesize', 'lsp_progress' },
        lualine_x = {
            { 'diagnostics', sources = { 'nvim_lsp' } },
            'encoding',
            'fileformat',
            'filetype',
        },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
    },
})
