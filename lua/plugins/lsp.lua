return {
        {
                "williamboman/mason.nvim",
                config = function()
                        require("mason").setup()
                end
        },
        {
                "williamboman/mason-lspconfig.nvim",
                config = function()
                        require("mason-lspconfig").setup {
                                ensure_installed = { "clangd", "rust_analyzer", "lua_ls" },
                        }
                end
        },
        {
                "neovim/nvim-lspconfig",
                config = function()
                        local lspconf = require('lspconfig')
                        lspconf.clangd.setup({})
                        lspconf.rust_analyzer.setup({})
                        lspconf.lua_ls.setup({})
                        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                        --vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
                        --vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
                        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
                        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
                        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                        vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
                        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
                        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
                        vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
                        vim.keymap.set('n','<leader>s',vim.lsp.buf.hover,{})
                end
        },
}
