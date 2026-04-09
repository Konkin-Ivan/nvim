return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function () 
            local configs = require("nvim-treesitter.configs")
            
            configs.setup({
                -- Обязательные поля
                ensure_installed = {},        -- ничего не форсировать
                ignore_install = {},           -- все языки разрешены
                modules = {},                  -- стандартная загрузка
                
                -- Автоматическая установка (работает с ensure_installed = {})
                auto_install = true,
                sync_install = false,
                
                -- Подсветка и отступы
                highlight = { 
                    enable = true,
                    -- disable = { "latex" }, -- отключить для некоторых языков
                },
                indent = { enable = true },
            })
        end
    }
}
