-- [[ Autoformat python files on save ]]
vim.api.nvim_create_augroup("AutoFormat", {})
vim.api.nvim_create_autocmd(
    "BufWritePost",
    {
        pattern = "*.py",
        group = "AutoFormat",
        callback = function()
            vim.cmd("silent !isort %")

            -- This is overly intrusive for autoformatting
            -- vim.cmd("silent !autoflake --in-place --remove-unused-variables --remove-all-unused-imports %")

            -- vim.cmd("silent !black --quiet %")

            vim.cmd("silent !ruff format %")

            vim.cmd("edit")
        end,
    }
)
vim.api.nvim_create_autocmd(
    "BufWritePost",
    {
        pattern = "*.rs",
        group = "AutoFormat",
        callback = function()
            vim.cmd("silent !rustfmt %")

            vim.cmd("edit")
        end,
    }
)

