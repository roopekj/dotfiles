require("catppuccin").setup({
    flavour = "macchiato", -- latte, frappe, macchiato, mocha
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
    },
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
            enabled = true,
            indentscope_color = "",
        },
    },
})
vim.cmd.colorscheme "catppuccin"

