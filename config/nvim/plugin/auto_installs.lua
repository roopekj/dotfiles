-- [[ Linters and formatters ]]
require("mason-tool-installer").setup {
	  ensure_installed = { "stylua", "shfmt", "shellcheck", "black", "isort", "rust-analyzer" },
	  auto_update = false,
	  run_on_start = true,
}

