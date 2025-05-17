return {
  "shellRaining/hlchunk.nvim",
  config = function()
    require("hlchunk").setup({
      indent = { enable = true }, -- Подсветка отступов
      chunk = { enable = true },  -- Подсветка блоков (скобок)
    })
  end
}
