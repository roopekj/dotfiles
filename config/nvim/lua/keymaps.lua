-- Helper function to make the mappings less verbose
local map = function(keys, func, desc, mode)
	mode = mode or "n"
	vim.keymap.set(mode, keys, func, { desc = desc, silent = true })
end

-- Clear highlights on search when pressing <Esc> in normal mode
map("<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
map("<leader>q", vim.diagnostic.setloclist, "Open diagnostic [Q]uickfix list")

-- Focus view while navigating
map("<C-d>", "<C-d>zz")
map("<C-u>", "<C-u>zz")
map("<C-f>", "<C-f>zz")
map("<C-b>", "<C-b>zz")
map("n", "nzzzv")
map("N", "Nzzzv")

-- Disable arrow keys in all modes
map("<Left>", "")
map("<Down>", "")
map("<Up>", "")
map("<Right>", "")

map("<Left>", "", "i")
map("<Down>", "", "i")
map("<Up>", "", "i")
map("<Right>", "", "i")

map("<Left>", "", "c")
map("<Down>", "", "c")
map("<Up>", "", "c")
map("<Right>", "", "c")

map("<Left>", "", "v")
map("<Down>", "", "v")
map("<Up>", "", "v")
map("<Right>", "", "v")

-- <leader>p doesn't overwrite copy buffer when pasting over existing text
map("<leader>p", [["_dp"]], "x")
map("<leader>d", [["_dd"]], "x")
map("<leader>c", [["_dc"]], "x")
map("<leader>x", [["_dx"]], "x")

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Keybinds for tabs
map("<leader>tn", ":tabnew<cr>", "Open new tab")
map("<leader>tc", ":tabclose<cr>", "Close current tab")
map("<C-l>", ":tabnext<cr>", "Go one tab forward")
map("<C-h>", ":tabprev<cr>", "Go one tab backward")

-- By default, closing the current tab opens up the next tab, ie. the one on the right.
-- This is especially awkward when you're quickly checking the definition or usage of a variable,
-- and then want to go back. Now you have to also switch tabs after closing the one that was opened.
-- This overrides that behavior, always going to the tab that is one slot to the left.
vim.api.nvim_create_user_command("QGotoLeft", function()
	local total = vim.fn.tabpagenr("$")
	if total == 1 then
		vim.cmd("exit")
	end

	local current = vim.fn.tabpagenr()
	local target = 1
	if current > 1 then
		target = current - 1
	end

	vim.cmd("tabclose")
	vim.cmd("tabnext " .. target)
end, {})
vim.cmd([[cabbrev q QGotoLeft]])

-- Diagnostic keymaps
map("[d", vim.diagnostic.goto_prev, "Go to previous diagnostic message")
map("]d", vim.diagnostic.goto_next, "Go to next diagnostic message")
map("<leader>e", vim.diagnostic.open_float, "Open floating diagnostic message")
map("<leader>q", vim.diagnostic.setloclist, "Open diagnostics list")

-- Clear search highlights when pressing Esc
map("<Esc>", ":noh<Cr><Esc>")

-- Global keymaps related to `telescope.nvim`
local telescope = require("telescope.builtin")
map("<leader>?", telescope.oldfiles, "[?] Find recently opened files")
map("<leader><space>", telescope.buffers, "[ ] Find existing buffers")
map("<leader>/", function()
	-- A nicer looking search from current buffer
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, "[/] Fuzzily search in current buffer")
map("<leader>sh", telescope.help_tags, "[S]earch [H]elp")
map("<leader>sk", telescope.keymaps, "[S]earch [K]eymaps")
map("<leader>sf", telescope.find_files, "[S]earch [F]iles")
map("<leader>ss", telescope.builtin, "[S]earch [S]elect Telescope")
map("<leader>sw", telescope.grep_string, "[S]earch current [W]ord")
map("<leader>sg", telescope.live_grep, "[S]earch by [G]rep")
map("<leader>sG", ":LiveGrepGitRoot<cr>", "[S]earch by [G]rep on Git Root")
map("<leader>sd", telescope.diagnostics, "[S]earch [D]iagnostics")
map("<leader>sr", telescope.resume, "[S]earch [R]esume")
map("<leader>s.", telescope.oldfiles, '[S]earch Recent Files ("." for repeat)')
map("<leader><leader>", telescope.buffers, "[ ] Find existing buffers")
map("<leader>s/", function()
	telescope.live_grep({
		grep_open_files = true,
		prompt_title = "Live Grep in Open Files",
	})
end, "[S]earch [/] in Open Files")

map("<leader>/", function()
	telescope.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, "[/] Fuzzily search in current buffer")

-- Remove conflict with `which-key.nvim`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
