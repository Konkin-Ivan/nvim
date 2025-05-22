return {
  "Olical/conjure",
  ft = { "clojure" },
  lazy = true,
  init = function()
    -- Отключаем поиск файла .nrepl-port и auto-repl
    vim.g["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = false

    -- Указываем хост и порт вручную
    vim.g["conjure#client#clojure#nrepl#connection#default_host"] = "172.24.0.2"
    vim.g["conjure#client#clojure#nrepl#connection#default_port"] = 5555

    -- Настройка сочетаний клавиш
    vim.keymap.set('n', '<leader>cc', '<cmd>ConjureConnect<CR>', { silent = true })
    vim.keymap.set('n', '<leader>ce', '<cmd>ConjureEvalCurrentForm<CR>', { silent = true })
    vim.keymap.set('n', '<leader>cl', '<cmd>ConjureEvalCurrentLine<CR>', { silent = true })
    vim.keymap.set('n', '<leader>cb', '<cmd>ConjureEvalBuf<CR>', { silent = true })
    vim.keymap.set('n', '<leader>cs', '<cmd>ConjureSchool<CR>', { silent = true })
  end,
}
