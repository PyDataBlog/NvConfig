local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

	-- Override plugin definition options
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- format & linting
			{
				"jose-elias-alvarez/null-ls.nvim",
				config = function()
					require("custom.configs.null-ls")
				end,
			},
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end, -- Override to setup mason-lspconfig
	},

	-- override plugin configs
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},
	{
		"nvim-telescope/telescope.nvim",
		opts = function()
			local conf = require("plugins.configs.telescope")
			conf.defaults.mappings.i = {
				["<C-j>"] = require("telescope.actions").move_selection_next,
				["<Esc>"] = require("telescope.actions").close,
			}
			return conf
		end,
	},
	{
		"hrsh7th/nvim-cmp",

		opts = function()
			local conf = require("plugins.configs.cmp")
			conf.mapping["<C-k>"] = require("cmp").mapping.select_prev_item()
			conf.mapping["<C-j>"] = require("cmp").mapping.select_next_item()
			table.insert(conf.sources, { name = "vim-dadbod-completion" })
			return conf
		end,
	},
	{
		"NvChad/nvim-colorizer.lua",
		enabled = false,
	},
	-- Personal plugins
	{
		"Pocco81/TrueZen.nvim",
		cmd = { "TZAtaraxis", "TZMinimalist" },
		config = function()
			require("custom.configs.truezen")
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = "mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
		},
	},
	{
		"nvim-neotest/neotest-python",
		ft = "python",
		dependencies = {
			"mfussenegger/nvim-dap",
			"mfussenegger/nvim-dap-python",
		},
		config = function()
			vim.cmd([[ autocmd FileType python lua require('dapui').setup() ]])
			local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
			require("dap-python").setup(path)
			require("core.utils").load_mappings("dap")
			require("neotest").setup({
				adapters = {
					require("neotest-python")({
						dap = {
							justMyCode = false,
							console = "integratedTerminal",
						},
						args = { "--log-level", "DEBUG" },
						runner = "pytest",
						is_test_file = function(file_path)
							return file_path:match("test_.*%.py$") ~= nil
						end,
					}),
				},
			})
			require("core.utils").load_mappings("neotest")
		end,
	},
	{ "tpope/vim-dotenv", ft = "dotenv" },
	{ "tpope/vim-dadbod" },
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = {
			{ "tpope/vim-dadbod", lazy = true },
			{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
		},
		cmd = {
			"DBUI",
			"DBUIToggle",
			"DBUIAddConnection",
			"DBUIFindBuffer",
		},
		init = function()
			vim.g.db_ui_use_nerd_fonts = 1
		end,
	},
	{
		"jackMort/ChatGPT.nvim",
		event = "VeryLazy",
		lazy = true,
		config = function()
			require("chatgpt").setup()
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
	{
		"akinsho/toggleterm.nvim",
		lazy = false,
		version = "*",
		opts = require("custom.configs.toggleterm").setup,
	},
	{ "tpope/vim-obsession" },
	{ "tpope/vim-fugitive" },
	{ "ThePrimeagen/vim-be-good" },
	{ "johngrib/vim-game-code-break" },
	{ "johngrib/vim-game-snake" },
	{ "dstein64/nvim-scrollview", lazy = false },
	{
		"zbirenbaum/copilot.lua",
		event = "InsertEnter",
		opts = require("custom.configs.copilot").setup,
	},
	{
		"NvChad/nvcommunity",
		{ import = "nvcommunity.git.lazygit" },
		{ import = "nvcommunity.lsp.barbecue" },
		{ import = "nvcommunity.lsp.prettyhover" },
		{ import = "nvcommunity.lsp.codeactionmenu" },
		{ import = "nvcommunity.diagnostics.trouble" },
		{ import = "nvcommunity.motion.hop" },
		-- { import = "nvcommunity.folds.ufo" },
		-- { import = "nvcommunity.editor.undo" },
		-- { import = "nvcommunity.completion.copilot" },
		{ import = "nvcommunity.editor.rainbowdelimiters" },
		-- TODO: Add more community plugins
	},
}

return plugins
