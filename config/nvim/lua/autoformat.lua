vim.api.nvim_create_augroup("AutoFormat", {})
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*.py",
	group = "AutoFormat",
	callback = function()
		-- If you feel like it, you can have autoflake remove all unused things on every save.
		-- vim.cmd("silent !autoflake --in-place --remove-unused-variables --remove-all-unused-imports %")
		-- vim.cmd("edit")
	end,
})
