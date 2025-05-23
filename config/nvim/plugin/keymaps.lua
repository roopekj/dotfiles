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

vim.keymap.set("v", "<Left>", "")
vim.keymap.set("v", "<Down>", "")
vim.keymap.set("v", "<Up>", "")
vim.keymap.set("v", "<Right>", "")

-- <leader>p doesn't overwrite copy buffer when pasting over existing text
vim.keymap.set("x", "<leader>p", [["_dp"]], { silent = true })
vim.keymap.set("x", "<leader>d", [["_dd"]], { silent = true })
vim.keymap.set("x", "<leader>c", [["_dc"]], { silent = true })
vim.keymap.set("x", "<leader>x", [["_dx"]], { silent = true })

-- Hide this, it will pull up which-key.nvim
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Keybinds for tabs
vim.keymap.set("n", "<leader>tn", ":tabnew<cr>", { desc = "Open new tab", silent = true })
vim.keymap.set("n", "<leader>tc", ":tabclose<cr>", { desc = "Close current tab", silent = true })
vim.keymap.set("n", "<C-l>", ":tabnext<cr>", { desc = "Go one tab forward", silent = true })
vim.keymap.set("n", "<C-h>", ":tabprev<cr>", { desc = "Go one tab backward", silent = true })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Clear search highlights when pressing Esc
vim.keymap.set("n", "<Esc>", ":noh<Cr><Esc>", { silent = true })

-- See `:help telescope.builtin`
vim.keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
vim.keymap.set("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>/", function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer" })

local function telescope_live_grep_open_files()
	require("telescope.builtin").live_grep({
		grep_open_files = true,
		prompt_title = "Live Grep in Open Files",
	})
end

local telescope = require("telescope.builtin")
vim.keymap.set("n", "<leader>sh", telescope.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sk", telescope.keymaps, { desc = "[S]earch [K]eymaps" })
vim.keymap.set("n", "<leader>sf", telescope.find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>ss", telescope.builtin, { desc = "[S]earch [S]elect Telescope" })
vim.keymap.set("n", "<leader>sw", telescope.grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", telescope.live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sG", ":LiveGrepGitRoot<cr>", { desc = "[S]earch by [G]rep on Git Root" })
vim.keymap.set("n", "<leader>sd", telescope.diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sr", telescope.resume, { desc = "[S]earch [R]esume" })
vim.keymap.set("n", "<leader>s.", telescope.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set("n", "<leader><leader>", telescope.buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>s/", function()
	telescope.live_grep({
		grep_open_files = true,
		prompt_title = "Live Grep in Open Files",
	})
end, { desc = "[S]earch [/] in Open Files" })

vim.keymap.set("n", "<leader>/", function()
	telescope.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer" })
