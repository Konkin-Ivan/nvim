return {
  "yetone/avante.nvim",
  build = vim.fn.has("win32") ~= 0
      and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
      or "make",
  event = "VeryLazy",
  version = false, -- Никогда не ставьте "*"! Никогда!
  ---@module 'avante'
  -- ---@type avante.Config
  opts = {
    -- файл с инструкциями для конкретного проекта
    instructions_file = "avante.md",
    -- 👇 ВАЖНО: выбираем LM Studio как основной провайдер
    provider = "lm_studio",
    -- настройка всех провайдеров
    providers = {
      -- ==============================================
      -- LM STUDIO (локальный сервер)
      -- ==============================================
      lm_studio = {
        __inherited_from = "openai",  -- наследуем базовые настройки OpenAI
        endpoint = "http://192.168.48.244:1234/v1",  -- ваш IP и порт LM Studio
        api_key_name = "",  -- LM Studio не требует API ключа
        model = "local-model",  -- имя модели (можно любое, LM Studio игнорирует)
        timeout = 60000,  -- таймаут 60 секунд (для больших моделей)
        -- дополнительные параметры запроса
        extra_request_body = {
          temperature = 0.75,
          max_tokens = 32768,
          top_p = 0.95,      -- разнообразие ответов
          frequency_penalty = 0.0,  -- штраф за повторения
          presence_penalty = 0.0,   -- штраф за новые темы
          stream = true,     -- стриминг ответов
        },
      },
      -- ==============================================
      -- ОПЦИОНАЛЬНО: Claude (облачный)
      -- ==============================================
      claude = {
        endpoint = "https://api.anthropic.com",
        model = "claude-sonnet-4-20250514",
        timeout = 30000,
        extra_request_body = {
          temperature = 0.75,
          max_tokens = 20480,
        },
      },
      -- ==============================================
      -- ОПЦИОНАЛЬНО: Moonshot (облачный)
      -- ==============================================
      moonshot = {
        endpoint = "https://api.moonshot.ai/v1",
        model = "kimi-k2-0711-preview",
        timeout = 30000,
        extra_request_body = {
          temperature = 0.75,
          max_tokens = 32768,
        },
      },
      -- ==============================================
      -- ОПЦИОНАЛЬНО: OpenAI (если есть ключ)
      -- ==============================================
      openai = {
        endpoint = "https://api.openai.com/v1",
        model = "gpt-4-turbo-preview",
        timeout = 30000,
        extra_request_body = {
          temperature = 0.75,
          max_tokens = 4096,
        },
      },
    },
    -- ==============================================
    -- НАСТРОЙКИ ИНТЕРФЕЙСА
    -- ==============================================
    behaviour = {
      -- автоматическое применение diff при редактировании
      auto_apply_diff = false,
      -- подтверждение перед применением изменений
      confirm_diff = true,
      -- автоматическое переключение на боковую панель при открытии
      auto_set_highlight_group = true,
      -- автоматическое поднятие чата при ответе
      auto_focus_panel = true,
    },
    -- настройки окна чата
    windows = {
      --- положение окна: left, right, float
      position = "right",
      --- ширина в процентах от экрана
      width = 35,
      --- высота для float окна
      height = 30,
      --- заголовок окна
      title = "🤖 Avante AI",
      --- показывать заголовок
      show_title = true,
      --- использовать двойную границу
      border_double = false,
    },
    -- настройки ввода
    input = {
      --- размер поля ввода
      height = 5,
      --- подсказка в поле ввода
      prompt = "💬 Ask AI...",
    },
    -- ==============================================
    -- НАСТРОЙКИ КОНТЕКСТА
    -- ==============================================
    context = {
      -- показывать контекст в чате
      show_context_in_chat = true,
      -- максимальное количество файлов в контексте
      max_files = 10,
      -- показывать предпросмотр файлов
      show_file_preview = true,
    },
    -- ==============================================
    -- НАСТРОЙКИ ВИЗУАЛИЗАЦИИ
    -- ==============================================
    highlights = {
      --- цвет выделения diff
      diff = {
        add = "DiffAdd",
        remove = "DiffRemove",
        change = "DiffChange",
      },
    },
    -- ==============================================
    -- НАСТРОЙКИ ДЛЯ IMG-CLIP (вставка изображений)
    -- ==============================================
    image_paste = {
      enabled = true,
      -- LM Studio не поддерживает изображения, но оставим для других провайдеров
      provider = "none",  -- none, imgur, cloudinary
    },
    -- ==============================================
    -- ДОПОЛНИТЕЛЬНЫЕ НАСТРОЙКИ
    -- ==============================================
    --- файлы, которые исключаются из @mention
    exclude_files = {
      "*.lock",
      "*.log",
      "*.tmp",
      "*.swp",
      ".git/",
      "node_modules/",
      ".venv/",
      "__pycache__/",
    },
  },
  -- ==============================================
  -- ЗАВИСИМОСТИ
  -- ==============================================
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- Опциональные зависимости для улучшения UX
    "nvim-mini/mini.pick",           -- для выбора файлов
    "nvim-telescope/telescope.nvim", -- альтернативный выбор файлов
    "hrsh7th/nvim-cmp",              -- автодополнение команд
    "ibhagwan/fzf-lua",              -- выбор файлов через fzf
    "stevearc/dressing.nvim",        -- улучшенный ввод
    "folke/snacks.nvim",             -- альтернативный ввод
    "nvim-tree/nvim-web-devicons",   -- иконки
    -- поддержка вставки изображений
    {
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          use_absolute_path = true,  -- нужно для Windows
        },
      },
    },
    -- рендер markdown в чате
    {
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
  -- ==============================================
  -- ХОТКЕИ (опционально)
  -- ==============================================
  keys = {
    -- основной чат
    { "<leader>aa", "<cmd>AvanteChat<cr>", desc = "Open Avante Chat" },
    -- переключение боковой панели
    { "<leader>at", "<cmd>AvanteToggle<cr>", desc = "Toggle Avante Panel" },
    -- быстрый вопрос о выделенном коде
    { "<leader>aq", "<cmd>AvanteAsk<cr>", desc = "Ask about selection", mode = "v" },
    -- редактирование кода
    { "<leader>ae", "<cmd>AvanteEdit<cr>", desc = "Edit code", mode = "v" },
    -- переключение провайдера
    { "<leader>as", "<cmd>AvanteSwitchProvider<cr>", desc = "Switch AI Provider" },
  },
}
