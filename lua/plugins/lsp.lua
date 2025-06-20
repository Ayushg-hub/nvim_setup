return {
        "neovim/nvim-lspconfig",
        opts = {},
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            'saghen/blink.cmp'
        },
        config = function() 
                local capabilitites = require('blink.cmp').get_lsp_capabilities()
                require("lspconfig").lua_ls.setup {capabilitites = capabilitites}
                require("lspconfig").gopls.setup {capabilitites = capabilitites}
                require("lspconfig").zls.setup {capabilitites = capabilitites}
                require("lspconfig").rust_analyzer.setup {capabilitites = capabilitites}
        end,
    }
