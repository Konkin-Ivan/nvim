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
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "gopls",
                    "phpactor",
                    "clojure_lsp"
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({})
            lspconfig.gopls.setup({})
            lspconfig.phpactor.setup({
                init_options = {
                    ["symfony.enabled"] = true,
                },
            })
            lspconfig.clojure_lsp.setup({
                cmd = {
                    "docker", "exec", "-i", "clojure-dev", "clojure-lsp"
                },
            on_attach = function(client, bufnr)
                -- Ключевые привязки для LSP
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr })
                    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr })
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr })
                    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { buffer = bufnr })
                end,
                settings = {
                    clojure = {
                        lint = {
                            enabled = true,  -- Включить линтер
                        },
                    },
                },
            })
        end
    }
}
