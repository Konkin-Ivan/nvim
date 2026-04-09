-- diagnostic: настроено до LSP
vim.diagnostic.config({
  virtual_text = { prefix = "●", spacing = 4 },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    -- source = "always",  -- УДАЛИТЕ эту строку или замените на:
    header = "",           -- опционально
    prefix = "",           -- опционально
    -- Для отображения источника используйте:
    format = function(diagnostic)
      return string.format("%s [%s]", diagnostic.message, diagnostic.source)
    end,
  },
})

-- (опционально) старый глобальный флаг можно убрать
-- vim.g.diagnostic_enable_virtual_text = 1

-- базовые опции
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.swapfile = false
vim.wo.number = true

vim.keymap.set("i", "<A-o>", "<Esc>", { noremap = true, silent = true })

-- отключаем провайдеры (если действительно не нужны)
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
