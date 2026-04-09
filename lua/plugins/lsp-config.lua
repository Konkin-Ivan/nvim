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
          "clojure_lsp"
        }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Общие настройки для всех LSP
      local on_attach = function(_, bufnr)
        -- Ключевые привязки для LSP
        local opts = { buffer = bufnr }
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
        -- Дополнительные полезные привязки
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)
      end

      -- Условная загрузка LSP для Lua
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "lua",
        callback = function()
          vim.lsp.start({
            name = "lua_ls",
            cmd = { "lua-language-server" },
            on_attach = on_attach,
            settings = {
              Lua = {
                runtime = { version = 'LuaJIT' },
                diagnostics = { globals = { 'vim' } },
                workspace = {
                  library = vim.api.nvim_get_runtime_file("", true),
                  checkThirdParty = false
                },
                telemetry = { enable = false },
              }
            }
          })
        end,
      })

      -- Условная загрузка LSP для Go
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "go",
        callback = function()
          vim.lsp.start({
            name = "gopls",
            cmd = { "gopls" },
            on_attach = on_attach,
          })
        end,
      })

      -- Условная загрузка LSP для Clojure
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "clojure",
        callback = function()
          local util = require('lspconfig.util')
          local fname = vim.api.nvim_buf_get_name(0)
          vim.lsp.start({
            name = "clojure_lsp",
            cmd = { "clojure-lsp" },
            on_attach = on_attach,
            root_dir = util.find_git_ancestor(fname) or util.path.dirname(fname),
            settings = {
              clojure = {
                lint = { enabled = true },
                sourcePaths = { "src", "test" }
              },
            },
          })
        end,
      })
    end
  }
}
