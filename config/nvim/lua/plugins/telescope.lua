-- Fuzzy Finder
return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",

			build = "make",

			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },
	},
	config = function()
		-- Patterns for removing noisy results when searching with either find_files, live_grep or grep_string
		local file_ignore_patterns = {
			".git/",
			".cache",
			"%.o$",
			"%.so$",
			"%.a$",
			"%.out$",
			"%.class$",
			"%.pdf$",
			"%.mkv$",
			"%.mp4$",
			"%.zip$",
			"%.png$",
			"%.jpg$",
			"%.pyc$",
			"%.gz$",
			"%.webp$",
			"%.gif$",
			"node_modules/",
		}
		require("telescope").setup({
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
			pickers = {
				find_files = {
					hidden = true,
					file_ignore_patterns = file_ignore_patterns,
				},
				live_grep = {
					additional_args = { "--hidden" },
					file_ignore_patterns = file_ignore_patterns,
				},
				grep_string = {
					additional_args = { "--hidden" },
					file_ignore_patterns = file_ignore_patterns,
				},
			},
		})

		-- Telescope extensions
		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")
	end,
}
