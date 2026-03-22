return {
	"mfussenegger/nvim-lint",
	event = "BufReadPost",
	config = function()
		local lint = require("lint")

		vim.api.nvim_create_autocmd({ "BufEnter" }, {
			callback = function()
				lint.try_lint()
			end,
		})

		lint.linters_by_ft = {
			yaml = { "dclint" },
			dockerfile = { "hadolint" },
		}
	end,
}
