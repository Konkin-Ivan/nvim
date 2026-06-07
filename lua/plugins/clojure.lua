return {
  "Olical/conjure",
  ft = { "clojure" },
  lazy = true,
  keys = {
    { "<leader>cc", "<cmd>ConjureConnect<CR>", desc = "Conjure: Connect to REPL" },
    { "<leader>ce", "<cmd>ConjureEvalCurrentForm<CR>", desc = "Conjure: Eval current form" },
    { "<leader>cl", "<cmd>ConjureEvalCurrentLine<CR>", desc = "Conjure: Eval current line" },
    { "<leader>cb", "<cmd>ConjureEvalBuf<CR>", desc = "Conjure: Eval buffer" },
    { "<leader>cs", "<cmd>ConjureSchool<CR>", desc = "Conjure: Open School" },
    { "<leader>ls", "<cmd>ConjureLogSplit<CR>", desc = "Conjure: Open log (split)" },
    { "<leader>lt", "<cmd>ConjureLogToggle<CR>", desc = "Conjure: Toggle log" },
    { "<leader>lq", "<cmd>ConjureLogCloseVisible<CR>", desc = "Conjure: Close visible logs" },
  },
  init = function()
    -- === Настройки окна лога ===
    vim.g["conjure#log#hud#width"] = 1
    vim.g["conjure#log#hud#height"] = 0.3
    vim.g["conjure#log#wrap"] = false
    vim.g["conjure#log#auto_open"] = false
    vim.g["conjure#log#hud#enabled"] = false
    vim.g["conjure#log#hud#close_on_normal_mode"] = false
    vim.g["conjure#log#jump_to_latest#enabled"] = false

    -- === Подключение к REPL ===
    -- Отключаем авто-поиск .nrepl-port
    vim.g["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = false
    -- Явно указываем, куда стучаться
    vim.g["conjure#client#clojure#nrepl#connection#default_host"] = "localhost"
    vim.g["conjure#client#clojure#nrepl#connection#default_port"] = 5556
  end,
}
