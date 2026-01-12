-- Set <space> as the leader key.
-- These need to happen before setting up `lazy.nvim`
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Highlight when yanking text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Installs `lazy.nvim` under ~/.local/share/nvim by cloning from Github
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end

-- Make `lazy.nvim` visible in runtimepaths
---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- This sets up effectively everything in the editor
require("lazyinit")

-- Additional configurations related to minor functionalities
require("options")
require("keymaps")
require("autoformat")
require("user_commands")
require("theme")

-- Modeline
-- vim: ts=2 sts=2 sw=2 et
