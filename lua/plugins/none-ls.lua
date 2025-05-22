return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.zprint,        -- Lua
                null_ls.builtins.formatting.cljstyle,      -- Clojure
                -- для Руби
                --null_ls.builtins.diagnostics.rubocop,
                --null_ls.builtins.formatting.rubocop,
                -- для PHP
				null_ls.builtins.formatting.phpcsfixer,
			},
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
