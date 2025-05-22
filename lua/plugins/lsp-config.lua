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

      -- Общие настройки для всех LSP
      local on_attach = function(_, bufnr)
        -- Ключевые привязки для LSP
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr })
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr })
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr })
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { buffer = bufnr })
      end

      -- Условная загрузка LSP для Lua
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "lua",
        callback = function()
          lspconfig.lua_ls.setup({ on_attach = on_attach })
        end,
      })

      -- Условная загрузка LSP для Go
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "go",
        callback = function()
          lspconfig.gopls.setup({ on_attach = on_attach })
        end,
      })

      -- Условная загрузка LSP для PHP
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "php",
        callback = function()
          lspconfig.phpactor.setup({
            on_attach = on_attach,
            init_options = {
              ["symfony.enabled"] = true,
            },
          })
        end,
      })

      -- Условная загрузка LSP для Clojure
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "clojure",
        callback = function()
          lspconfig.clojure_lsp.setup({
            cmd = { "clojure-lsp" },
            filetypes = { "clojure", "edn" },
            on_attach = on_attach,
            settings = {
              clojure = {
                lint = {
                  enabled = true,  -- Включить линтер
                },
              },
            },
          })
        end,
      })
    end
  }
}
