-- Calling all the different linters in order to autoformat on save
return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		notify_on_error = false,
		format_on_save = function(bufnr)
			-- C projects don't usually have a standardized coding style, so let's not even try.
			-- If you happen to find a .clang-format, feel free to re-enable formatting here.
			local disable_filetypes = { c = true }
			if disable_filetypes[vim.bo[bufnr].filetype] then
				return nil
			else
				return {
					timeout_ms = 500,
					lsp_format = "fallback",
					lsp_fallback = true,
				}
			end
		end,
		formatters_by_ft = {
			lua = { "stylua" },
			rust = { "rustfmt" },
			dockerfile = { "docker" },
			python = { "ruff_organize_imports", "ruff_fix", "ruff_format" },
			c = { "clang_format" },
			cpp = { "clang_format" },
			sh = { "shfmt" },
			go = { "gopls" },
			sql = { "pgformatter" },
			typescript = { "prettier" },
			javascript = { "prettier" },
			vue = { "prettier" },
		},
	},
}
