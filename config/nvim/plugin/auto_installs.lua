-- [[ Linters and formatters ]]
require("mason-tool-installer").setup {
	  ensure_installed = { "pyright", "stylua", "shfmt", "shellcheck", "black", "isort", "rust-analyzer", "html-lsp", "css-lsp", "tsserver" },
	  auto_update = false,
	  run_on_start = true,
}

