return {
  "Olical/conjure",
  ft = { "clojure" },
  lazy = true,
  init = function()
    -- Настройки окна
    vim.g["conjure#log#float#enabled"] = true
    vim.g["conjure#log#hud#width"] = 1
    vim.g["conjure#log#hud#height"] = 0.3
    vim.g["conjure#log#wrap"] = true
    vim.g["conjure#log#jump_to_latest#enabled"] = true
    -- Автоматически открывать лог при выполнении кода
    vim.g["conjure#log#auto_open"] = true
    -- Закрывать HUD при переходе в нормальный режим
    vim.g["conjure#log#hud#close_on_normal_mode"] = true
    -- Отключаем поиск файла .nrepl-port и auto-repl
    vim.g["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = false

    -- Указываем хост и порт вручную
    vim.g["conjure#client#clojure#nrepl#connection#default_host"] = "localhost"
    vim.g["conjure#client#clojure#nrepl#connection#default_port"] = 5555
    vim.g["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = false

    -- Настройка сочетаний клавиш
    vim.keymap.set('n', '<leader>cc', '<cmd>ConjureConnect<CR>', { silent = true })
    vim.keymap.set('n', '<leader>ce', '<cmd>ConjureEvalCurrentForm<CR>', { silent = true })
    vim.keymap.set('n', '<leader>cl', '<cmd>ConjureEvalCurrentLine<CR>', { silent = true })
    vim.keymap.set('n', '<leader>cb', '<cmd>ConjureEvalBuf<CR>', { silent = true })
    vim.keymap.set('n', '<leader>cs', '<cmd>ConjureSchool<CR>', { silent = true })
    vim.keymap.set('n', '<leader>ls', '<cmd>ConjureLogSplit<CR>') -- Открыть лог в split
    vim.keymap.set('n', '<leader>lt', '<cmd>ConjureLogToggle<CR>') -- Переключить видимость
    vim.keymap.set('n', '<leader>lq', '<cmd>ConjureLogCloseVisible<CR>') -- Закрыть все логи
  end,
}
