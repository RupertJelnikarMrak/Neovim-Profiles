local lsp = require('lsp-zero')

require('luasnip.loaders.from_vscode').lazy_load()

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })

    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set('n', '[d', function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set('n', ']d', function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end, opts)
    vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Configure Mason
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { 'lua_ls', 'jsonls', 'yamlls', 'dockerls', 'sqls', 'ts_ls', 'html', 'cssls', 'emmet_language_server' },
    automatic_installation = true,
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({
                on_attach = lsp.on_attach,
                capabilities = capabilities,
            })
        end,

        lua_ls = function()
            require('lspconfig').lua_ls.setup({
                settings = {
                    Lua = {
                        runtime = {
                            version = 'LuaJIT', -- Adjust to your Lua version if necessary
                        },
                        diagnostics = {
                            globals = { 'vim' }, -- Recognize the `vim` global variable
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdParty = false, -- Disable third-party library checks if not needed
                        },
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            })
        end,

        html = function()
            require('lspconfig').html.setup({
                filetypes = { 'html', 'php' },
            })
        end,

        emmet_language_server = function()
            require('lspconfig').emmet_language_server.setup({
                filetypes = { 'html', 'php' },
            })
        end,
    },
})

local cmp = require('cmp')

cmp.setup(
{
    mapping = cmp.mapping.preset.insert({
        [ '<C-b>' ] = cmp.mapping.scroll_docs(-4),
        [ '<C-f>' ] = cmp.mapping.scroll_docs(4),
        [ '<C-Space' ] = cmp.mapping.complete(),
        [ '<C-e>' ] = cmp.mapping.close(),
        [ '<CR>' ] = cmp.mapping.confirm({ select = true }),
    }),
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
    }
}
)

vim.api.nvim_set_keymap('n', '<leader>lr', '<cmd>lua vim.lsp.stop_client(vim.lsp.get_active_clients())<CR>', { noremap = true, silent = true })
