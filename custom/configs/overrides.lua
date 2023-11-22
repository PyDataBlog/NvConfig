local M = {}

M.treesitter = {
	ensure_installed = {
		"vim",
		"lua",
		"bash",
		"python",
		"julia",
		"go",
		"gosum",
		"gomod",
		"gowork",
		"gitignore",
		"dockerfile",
		"yaml",
		"make",
		"markdown_inline",
		"r",
		"rust",
		"sql",
		"ssh_config",
		"terraform",
		"toml",
		"tsv",
		"php",
		"pem",
		"julia",
		"java",
		"csv",
		"cpp",
		"cmake",
		"html",
		"css",
		"javascript",
		"typescript",
		"tsx",
		"json",
		"vue",
		"svelte",
		"c",
		"zig",
		"c_sharp",
		"cuda",
		"dart",
		"dot",
		"gitcommit",
		"gomod",
		"latex",
		"ruby",
	},
	indent = {
		enable = true,
		-- disable = {
		--   "python"
		-- },
	},
}

M.mason = {
	ensure_installed = {
		-- lua stuff
		"lua-language-server",
		"stylua",

		-- web dev stuff
		"css-lsp",
		"html-lsp",
		"prettier",

		-- c/cpp stuff
		"clangd",
		"clang-format",

		-- python stuff
		"pyright",
		"debugpy",
		"black",
		"ruff",

		--json stuff
		"json-lsp",
		"jsonlint",
		"jq",

		--bash stuff
		"bash-language-server",
		"shellcheck",

		--yaml stuff
		"yaml-language-server",
		"yamllint",
		"prettierd",

		--julia
		"julia-lsp",
	},
}

-- git support in nvimtree
M.nvimtree = {
	git = {
		enable = true,
	},

	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
	},
}

return M
