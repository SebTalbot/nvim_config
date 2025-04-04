local is_laptop = os.getenv("CURRENT_DEVICE") == "laptop"
local is_desktop = os.getenv("CURRENT_DEVICE") == "desktop"
local is_default = not is_laptop and not is_desktop

local plugins = {
	{
		"nvim-lua/plenary.nvim",
		lazy = false,
	},
	{
		"SebTalbot/everforest-nvim",
		lazy = false,
		enabled = is_desktop or is_laptop or is_default,
		priority = 1000,
		config = function()
			vim.opt.termguicolors = true
			require("everforest").setup({})
			vim.cmd([[colorscheme everforest]])
			vim.cmd([[hi ColorColumn  guibg=none]])
			vim.cmd([[hi Visual  guibg=#384B55]])
			vim.cmd([[hi Search gui=bold guibg=#a7c080]])
			vim.cmd([[hi IncSearch gui=bold guibg=#7fbbb3]])
			vim.cmd([[hi @character guifg=#D699B6]])
			vim.cmd([[hi @string.escape guifg=#E69875]])
			-- bugged in bufferline
			vim.cmd([[hi BufferLineIndicatorSelected guifg=#475258 guibg=#475258]])
			vim.cmd([[hi BufferLineDuplicate guifg=#7e8a82 guibg=#343f44]])
			vim.cmd([[hi BufferLineDuplicateSelected guifg=#7e8a82 guibg=#475258]])
			vim.cmd([[hi BufferLineDuplicateVisible guifg=#7e8a82 guibg=#343f44]])

			vim.cmd([[hi DiagnosticUnderlineError guifg=none]])
		end,
	},
	{
		"kyazdani42/nvim-web-devicons",
		lazy = false,
	},
	{
		"catgoose/nvim-colorizer.lua",
		event = "BufReadPre",
		opts = {
			user_default_options = {
				names = false,
			},
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		lazy = false,
		dependencies = {
			"nvim-web-devicons",
			"arkav/lualine-lsp-progress",
		},
		config = function()
			require("lualine").setup({
				options = {
					theme = "auto",
					ignore_focus = {
						"dapui_watches",
						"dapui_stacks",
						"dapui_breakpoints",
						"dapui_scopes",
						"dap-repl",
						"dapui_console",
					},
				},
				sections = {
					lualine_c = {
						{
							"filename",
							path = 1,
						},
					},
					lualine_x = {
						"lsp_progress",
					},
				},
			})
		end,
	},
	{
		"akinsho/bufferline.nvim",
		lazy = false,
		dependencies = {
			"nvim-web-devicons",
			"lualine.nvim",
		},
		version = "*",
		config = function()
			require("plugins.configs.bufferline")
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		lazy = false,
		main = "ibl",
		opts = {},
		config = function()
			require("ibl").setup()
		end,
	},
	{
		"SebTalbot/lens.vim",
		config = function()
			vim.cmd([[let g:lens#disabled = 1]])
		end,
	},
	{
		"stevearc/dressing.nvim",
		config = function()
			require("plugins.configs.dressing")
		end,
	},
	{
		"simnalamburt/vim-mundo",
		init = function()
			require("core.mappings").mundo()
		end,
	},
	{
		"tpope/vim-fugitive",
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("plugins.configs.gitsigns")
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("plugins.configs.toggleterm")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		config = function()
			require("plugins.configs.treesitter")
		end,
	},
	{
		"nvim-treesitter/playground",
	},
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		dependencies = {
			"nvim-treesitter",
		},
		config = function()
			require("ts_context_commentstring").setup({
				enable_autocmd = false,
			})
		end,
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup()
		end,
	},
	{
		"rbgrouleff/bclose.vim",
	},
	{
		"ashfinal/qfview.nvim",
		config = function()
			require("qfview").setup()
		end,
	},
	{
		"folke/which-key.nvim",
		version = "2.1.0",
		config = function()
			require("plugins.configs.which_key")
		end,
	},
	{
		"andymass/vim-matchup",
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("plugins.configs.autopairs")
		end,
	},
	{
		"terrortylor/nvim-comment",
		config = function()
			require("nvim_comment").setup({
				hook = function()
					require("ts_context_commentstring").update_commentstring()
				end,
			})
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"plenary.nvim",
			"telescope-fzf-native.nvim",
			{
				"nvim-telescope/telescope-live-grep-args.nvim",
				version = "^1.0.0",
			},
		},
		config = function()
			require("plugins.configs.telescope")
		end,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		-- dependencies = {
		--   "telescope.nvim",
		-- },
		build = "make",
	},
	{
		"LinArcX/telescope-env.nvim",
		dependencies = {
			"telescope.nvim",
		},
	},
	{
		"tknightz/telescope-termfinder.nvim",
		dependencies = {
			"telescope.nvim",
		},
	},
	{
		"ThePrimeagen/harpoon",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"telescope.nvim",
		},
	},
	{
		"mikavilpas/yazi.nvim",
		event = "VeryLazy",
		keys = {
			{
				"<leader>nn",
				"<cmd>Yazi<cr>",
				desc = "Open yazi at the current file",
			},
			{
				"<leader>np",
				"<cmd>Yazi cwd<cr>",
				desc = "Open the file manager in nvim's working directory",
			},
			{
				"<leader>nt",
				"<cmd>Yazi toggle<cr>",
				desc = "Toggle the last session",
			},
		},
		opts = {
			open_for_directories = true,
			yazi_floating_window_border = "none",
			keymaps = {
				show_help = "<f1>",
				open_file_in_vertical_split = "<c-v>",
				open_file_in_horizontal_split = "<c-x>",
				open_file_in_tab = "<c-t>",
				grep_in_directory = "<c-s>",
				replace_in_directory = "<c-g>",
				cycle_open_buffers = "<tab>",
				copy_relative_path_to_selected_files = "<c-y>",
				send_to_quickfix_list = "<c-q>",
				change_working_directory = "<c-\\>",
			},
		},
	},

	-- LSP plugins
	{
		"williamboman/mason.nvim",
		lazy = false,
		build = ":MasonUpdate",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"nanotee/sqls.nvim",
	},
	{
		"neovim/nvim-lspconfig",
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"mason.nvim",
			"nvim-lspconfig",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			require("plugins.configs.lsp")
		end,
	},
	{
		"nvimtools/none-ls.nvim",
	},

	-- DAP plugins
	{
		"mfussenegger/nvim-dap",
	},
	{
		"jayp0521/mason-nvim-dap.nvim",
		dependencies = {
			"nvim-dap",
		},
		config = function()
			require("plugins.configs.dap")
		end,
	},
	{
		"nvim-telescope/telescope-dap.nvim",
		dependencies = {
			"telescope.nvim",
			"nvim-dap",
		},
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"nvim-dap",
			"nvim-neotest/nvim-nio",
		},
		config = [[require("plugins.configs.dap.ui")]],
	},

	-- Completion & Snippets
	{
		"codota/tabnine-nvim",
		build = {
			"./dl_binaries.sh",
			"cd chat/; cargo build --release"
		},
		config = function()
			require("plugins.configs.tabnine")
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-path",
			"ray-x/cmp-treesitter",
		},
		config = function()
			require("plugins.configs.nvim_cmp")
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		build = "make install_jsregexp",
		dependencies = {
			-- "rafamadriz/friendly-snippets",
			-- "saadparwaiz1/cmp_luasnip",
		},
	},
}

return require("lazy").setup(plugins)
