return {
    "HiPhish/rainbow-delimiters.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
        require("nvim-treesitter.configs").setup({
            rainbow = {
                enable = true,
                extended_mode = true,
                languages = { "clojure", "lisp", "scheme" },
            },
        })
    end,
}
