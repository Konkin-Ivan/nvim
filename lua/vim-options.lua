vim.cmd("set expandtab")   -- преобразовывать табуляцию в пробелы
vim.cmd("set tabstop=4")        -- количество пробелов, которое соответствует одному табу
vim.cmd("set shiftwidth=4")     -- количество пробелов для каждого уровня отступа
vim.cmd("set softtabstop=4")    -- количество пробелов, имитирующих табуляцию

vim.cmd("set autoindent")  -- автоматический отступ новой строки
vim.cmd("set smartindent") -- автоматические отступы для C-подобных языков

vim.wo.number = true -- нумерация строк

vim.opt.swapfile = false -- оключить свап-файл
