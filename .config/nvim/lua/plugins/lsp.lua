local on_attach = function(_, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    require('lsp_signature').on_attach()

    local buf_keymap = vim.api.nvim_buf_set_keymap
    local opts = { noremap = true, silent = true }
    buf_keymap(bufnr, 'n', 'gd', '<cmd>lua require("lspsaga.provider").preview_definition()<CR>', opts)
    buf_keymap(bufnr, 'n', 'gh', '<cmd>lua require("lspsaga.provider").lsp_finder()<CR>', opts)
    buf_keymap(bufnr, 'n', '<Leader>ca', '<cmd>lua require("lspsaga.codeaction").code_action()<CR>', opts)
    buf_keymap(bufnr, 'v', '<Leader>ca', ':<C-U>lua require("lspsaga.codeaction").code_action()<CR>', opts)
    buf_keymap(bufnr, 'n', '<Leader>cd', '<cmd>lua require("lspsaga.diagnostic").show_line_diagnostics()<CR>', opts)
    buf_keymap(bufnr, 'n', '<Leader>cc', '<cmd>lua require("lspsaga.diagnostic").show_cursor_diagnostics()<CR>', opts)
    buf_keymap(bufnr, 'n', '[e', '<cmd>lua require("lspsaga.diagnostic").lsp_jump_diagnostic_prev()<CR>', opts)
    buf_keymap(bufnr, 'n', ']e', '<cmd>lua require("lspsaga.diagnostic").lsp_jump_diagnostic_next()<CR>', opts)
    buf_keymap(bufnr, 'n', 'K', '<cmd>lua require("lspsaga.hover").render_hover_doc()<CR>', opts)
    buf_keymap(bufnr, 'n', '<C-k>', '<cmd>lua require("lspsaga.signaturehelp").signature_help()<CR>', opts)
    buf_keymap(bufnr, 'n', '<C-f>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>', opts)
    buf_keymap(bufnr, 'n', '<C-b>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>', opts)
    -- buf_keymap(bufnr, 'n', 'rn', '<cmd>lua require("lspsaga.rename").rename()<CR>', opts)
    buf_keymap(bufnr, 'n', 'rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_keymap(bufnr, 'n', '<leader>cb', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

    vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local nvim_lsp = require('lspconfig')
local function switch_source_header_splitcmd(bufnr, splitcmd)
    bufnr = nvim_lsp.util.validate_bufnr(bufnr)
    local params = { uri = vim.uri_from_bufnr(bufnr) }
    vim.lsp.buf_request(
        bufnr,
        'textDocument/switchSourceHeader',
        params,
        nvim_lsp.util.compat_handler(function(err, result)
            if err then
                error(tostring(err))
            end
            if not result then
                print('Corresponding file can’t be determined')
                return
            end
            vim.api.nvim_command(splitcmd .. ' ' .. vim.uri_to_fname(result))
        end)
    )
end

nvim_lsp.clangd.setup({
    cmd = {
        'clangd',
        '--background-index',
        '--clang-tidy',
        '--completion-style=bundled',
        '--cross-file-rename',
        '--header-insertion=iwyu',
    },
    on_attach = on_attach,
    capabilities = capabilities,
    commands = {
        ClangdSwitchSourceHeader = {
            function()
                switch_source_header_splitcmd(0, 'edit')
            end,
            description = 'Open source/header in current buffer',
        },
        ClangdSwitchSourceHeaderVSplit = {
            function()
                switch_source_header_splitcmd(0, 'vsplit')
            end,
            description = 'Open source/header in a new vsplit',
        },
        ClangdSwitchSourceHeaderSplit = {
            function()
                switch_source_header_splitcmd(0, 'split')
            end,
            description = 'Open source/header in a new split',
        },
    },
})

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')
nvim_lsp.sumneko_lua.setup({
    cmd = { 'lua-language-server' },
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                path = runtime_path,
            },
            diagnostics = {
                globals = { 'vim', 'packer_plugins' },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file('', true),
            },
        },
    },
})
