return {
  dir = vim.fn.fnamemodify(debug.getinfo(1).short_src, ":h:h"),

  config = function()
    local plugins = require("lazy").plugins()
    local plugin_list = table.concat(
      vim.tbl_map(function(p) return string.format("- %s", p.name or "Unknown") end, plugins),
      "\n"
    )

    local content = [[

Справка

:Help - Открыть этот экран.
:Lazy - Управление плагинами.
'q' или 'ESC' для закрытия справки.
------------------------------------------------------------

Conjure
  1. Подключение к REPL:
    <leader>cc	ConjureConnect	Подключиться к nREPL.
  2. Выполнение кода:
    <leader>ce	Выполнить текущую форму (выделенную или под курсором).
    <leader>cl	Выполнить текущую строку.
    <leader>cb	Выполнить весь буфер.
  3. Управление логами:
    <leader>ls	Открыть лог в split (разделенное окно).
    <leader>lt	Переключить видимость лога.
    <leader>lq	Закрыть все видимые логи.
  4. Обучение (School Mode):
    <leader>cs	Включить режим обучения (показывает шаги выполнения).
------------------------------------------------------------

LSP
  Основные привязки LSP:
    K	vim.lsp.buf.hover	Показать информацию о символе под курсором (документация, тип данных и т. д.).
    gD - Перейти к объявлению символа (например, функции или класса).
    gd - Перейти к определению символа (где он был объявлен).
    <leader>ca - Показать доступные действия для текущей строки/блока (рефакторинг, автофикс и т. д.).
    gr - Показать все ссылки на символ (где он используется).
    <leader>rn - Переименовать символ (изменить имя везде, где он используется).
    <leader>d	- Показать диагностику (ошибки, предупреждения) под курсором.
-------------------------------------------------------------

TeleScope
  Основные привязки:
    <leader>ff	Поиск файлов по имени (аналог fd или find).
    <leader>fg	Поиск текста в проекте с использованием grep.
    <leader>fb	Список открытых буферов для быстрого переключения.
    <leader>fh	Поиск по документации Vim/Neovim (help tags).
-------------------------------------------------------------

Форматирование
  <leader>gf
-------------------------------------------------------------

Комментировать
  <leader>gсс — комментарий текущей строки
  <leader>gсс — комментарий текущей строки
  <leader>gc + движение — gcj, gck, gcgg и т.д.

  Визуальный режим: выделил → gc
-------------------------------------------------------------

Установленные плагины:
]] .. plugin_list

    vim.api.nvim_create_user_command("Help", function()
      -- Создаем буфер
      local buf = vim.api.nvim_create_buf(false, true)
      vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(content, "\n"))

      -- Настройки буфера
      vim.bo[buf].filetype = "help"
      vim.bo[buf].buflisted = false
      vim.bo[buf].modifiable = false

      -- Получаем размеры экрана
      local width = math.floor(vim.o.columns * 0.8)
      local height = math.floor(vim.o.lines * 0.8)

      -- Открываем окно как overlay (поверх текущего буфера)
      vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        width = width,
        height = height,
        col = math.floor((vim.o.columns - width) / 2),
        row = math.floor((vim.o.lines - height) / 2),
        style = "minimal", -- Убирает статусбар и линейки
        border = "rounded", -- Красивая рамка
      })

      -- Закрытие по 'q' или Escape
      vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = buf })
      vim.keymap.set("n", "<Esc>", "<cmd>close<CR>", { buffer = buf })
    end, {})
  end,
}

