return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"kyazdani42/nvim-web-devicons",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local actions_layout = require("telescope.actions.layout")
		local opts = {
			defaults = {
				layout_config = {
					vertical = {
						height = 0.99,
						width = 0.99,
						prompt_position = "top",
					},
				},
				layout_strategy = "vertical",
				preview = { highlight_limit = 0.1 }, -- MB
				prompt_prefix = " >> ",
				scroll_strategy = "limit",
				sorting_strategy = "ascending",
				mappings = {
					i = {
						["<C-a>"] = actions.toggle_all,
						["<C-e>"] = actions_layout.toggle_preview,
						["<M-n>"] = actions.results_scrolling_down,
						["<M-p>"] = actions.results_scrolling_up,
						["<C-\\>"] = actions.close,
					},
					n = {
						["<C-\\>"] = actions.close,
					},
				},
			},
			pickers = {
				find_files = {
					prompt_title = "Find Files (All)",
					follow = true,
					hidden = true,
					no_ignore = true,
				},
				grep_string = {
					prompt_title = "Fuzzy (All)",
					disable_coordinates = true,
					only_sort_text = false,
					search = "\\w",
					use_regex = true,
				},
				help_tags = {
					mappings = { i = { ["<CR>"] = actions.select_vertical } },
				},
				-- Syntax:
				-- https://docs.rs/regex/1.11.1/regex/#syntax
				live_grep = {
					prompt_title = "Ripgrep (All)",
					additional_args = {
						"--hidden",
						"--no-ignore",
					},
					disable_coordinates = false,
				},
				lsp_definitions = {
					prompt_title = "LSP Definitions (All)",
					fname_width = 60,
					path_display = { shorten = 4 },
					trim_text = true,
				},
				lsp_implementations = {
					prompt_title = "LSP Implementations (All)",
					fname_width = 60,
					path_display = { shorten = 4 },
					trim_text = true,
				},
				lsp_references = {
					prompt_title = "LSP References (All)",
					fname_width = 60,
					path_display = { shorten = 4 },
					trim_text = true,
				},
				lsp_type_definitions = {
					prompt_title = "LSP Type Definitions (All)",
					fname_width = 60,
					path_display = { shorten = 4 },
					trim_text = true,
				},
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
			},
		}
		telescope.setup(opts)
		telescope.load_extension("fzf")
	end,
}
