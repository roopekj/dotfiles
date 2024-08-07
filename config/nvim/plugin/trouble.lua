vim.keymap.set("n", "<leader>x", "<cmd>TroubleToggle<cr>",
  {silent = true, noremap = true, desc = "Troubleshoot"}
)

-- Diagnostic signs
-- https://github.com/folke/trouble.nvim/issues/52
local signs = {
    Error = " ",
    Warning = " ",
    Hint = " ",
    Information = " "
}
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end
