-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

vim.g.mapleader = " "

-- Focus view while navigating
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-f>", "<C-f>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Disable arrow keys
vim.keymap.set("n", "<Left>", "")
vim.keymap.set("n", "<Down>", "")
vim.keymap.set("n", "<Up>", "")
vim.keymap.set("n", "<Right>", "")

vim.keymap.set("i", "<Left>", "")
vim.keymap.set("i", "<Down>", "")
vim.keymap.set("i", "<Up>", "")
vim.keymap.set("i", "<Right>", "")

vim.keymap.set("c", "<Left>", "")
vim.keymap.set("c", "<Down>", "")
vim.keymap.set("c", "<Up>", "")
vim.keymap.set("c", "<Right>", "")

-- <leader>p doesn't overwrite copy buffer when pasting over existing text
vim.keymap.set("x", "<leader>p", [["_dP"]])

-- Relative line numbers to ease navigation
vim.opt.nu = true
vim.opt.relativenumber = true

-- Indendation and whitespace
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false

-- File management
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Colors
vim.opt.termguicolors = true

-- Number of lines shown
vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")

-- Fast updates
vim.opt.updatetime = 50
