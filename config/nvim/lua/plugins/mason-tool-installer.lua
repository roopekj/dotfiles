return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	config = function()
		local ensure_installed = {
			"clangd",
			"css-lsp",
			"gopls",
			"html-lsp",
			"json-lsp",
			"lua-language-server",
			"pyright",
			"docker-language-server",
			"ruff",
			"rust-analyzer",
			"stylua",
			"tailwindcss-language-server",
			"ts_ls",
			"vue_ls",
			"shfmt",
			"clang-format",
			"shellcheck",
		}

		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
	end,
}
