-- Always show (relative) line numbers
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
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Colors
vim.opt.termguicolors = true

-- Number of lines shown when scrolling
vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")

-- Make line numbers default
vim.wo.number = true

-- Disable mouse mode
vim.opt.mouse = ""

-- Sync clipboard between OS and Neovim
vim.opt.clipboard = "unnamedplus"

-- Do not break overly long lines
-- vim.opt.breakindent = false

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"

-- Set completeopt
vim.opt.completeopt = "menuone,noselect"
