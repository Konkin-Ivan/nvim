return {
    "Olical/conjure",
    ft = { "clojure", },
    lazy = true,
    init = function()
        -- Настройка автоматического запуска REPL
        vim.g["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = true
        vim.g["conjure#client#clojure#nrepl#connection#auto_repl#cmd"] = "make start-repl"
        -- vim.g["conjure#debug"] = true
        -- Настройка сочетаний клавиш
        vim.keymap.set('n', '<leader>cc', '<cmd>ConjureConnect<CR>', { silent = true })
        vim.keymap.set('n', '<leader>ce', '<cmd>ConjureEvalCurrentForm<CR>', { silent = true })
        vim.keymap.set('n', '<leader>cl', '<cmd>ConjureEvalCurrentLine<CR>', { silent = true })
        vim.keymap.set('n', '<leader>cb', '<cmd>ConjureEvalBuf<CR>', { silent = true })
        vim.keymap.set('n', '<leader>cs', '<cmd>ConjureSchool<CR>', { silent = true })
    end,

}
