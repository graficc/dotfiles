local M = {}

local nvim_lsp = require('lspconfig')
local on_attach = function(_, bufnr)
    require('lsp_signature').on_attach()

    local function buf_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    buf_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    local opts = { noremap = true, silent = true }
    buf_keymap('n', '<Leader>pd', '<cmd>lua require("lspsaga.provider").preview_definition()<CR>', opts)
    buf_keymap('n', '<Leader>ph', '<cmd>lua require("lspsaga.provider").lsp_finder()<CR>', opts)
    buf_keymap('n', '<Leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_keymap('n', '<Leader>gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_keymap('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_keymap('n', '<Leader>ca', '<cmd>lua require("lspsaga.codeaction").code_action()<CR>', opts)
    buf_keymap('v', '<Leader>ca', ':<C-U>lua require("lspsaga.codeaction").code_action()<CR>', opts)
    buf_keymap('n', '<Leader>cd', '<cmd>lua require("lspsaga.diagnostic").show_line_diagnostics()<CR>', opts)
    buf_keymap('n', '<Leader>cc', '<cmd>lua require("lspsaga.diagnostic").show_cursor_diagnostics()<CR>', opts)
    buf_keymap('n', '<leader>cb', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_keymap('n', '[d', '<cmd>lua require("lspsaga.diagnostic").lsp_jump_diagnostic_prev()<CR>', opts)
    buf_keymap('n', ']d', '<cmd>lua require("lspsaga.diagnostic").lsp_jump_diagnostic_next()<CR>', opts)
    buf_keymap('n', 'K', '<cmd>lua require("lspsaga.hover").render_hover_doc()<CR>', opts)
    buf_keymap('n', '<C-k>', '<cmd>lua require("lspsaga.signaturehelp").signature_help()<CR>', opts)
    buf_keymap('n', '<C-f>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>', opts)
    buf_keymap('n', '<C-b>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>', opts)
    -- buf_keymap('n', 'rn', '<cmd>lua require("lspsaga.rename").rename()<CR>', opts)
    vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

M.clangd = function()
    nvim_lsp.clangd.setup({
        cmd = {
            'clangd',
            '--background-index',
            '--clang-tidy',
            '--compile-commands-dir=build',
            '--completion-style=bundled',
            '--cross-file-rename',
            '--header-insertion=iwyu',
            '--pch-storage=disk',
            '--query-driver=/usr/bin/clang++',
            '-j=12',
        },
        on_attach = on_attach,
        capabilities = capabilities,
    })
end

M.sumneko_lua = function()
    local runtime_path = vim.split(package.path, ';')
    table.insert(runtime_path, 'lua/?.lua')
    table.insert(runtime_path, 'lua/?/init.lua')
    nvim_lsp.sumneko_lua.setup({
        cmd = { '/usr/bin/lua-language-server' },
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
            Lua = {
                runtime = {
                    version = 'LuaJIT',
                    path = runtime_path,
                },
                diagnostics = {
                    globals = { 'vim' },
                },
                workspace = {
                    library = vim.api.nvim_get_runtime_file('', true),
                },
            },
        },
    })
end

return M
