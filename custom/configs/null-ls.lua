local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local sources = {
	formatting.prettier,
	formatting.prettierd,
	formatting.stylua,
	formatting.black,
	formatting.isort,
	formatting.jq,
	formatting.beautysh,

	lint.shellcheck,
	lint.jsonlint,
	lint.yamllint,

	lint.flake8.with({
		args = {
			"--ignore=E203,E266,E501,W503,F403,F401,E712,C901,E402,F405",
			"--max-line-length=120",
			"--max-complexity=18",
			"--select=B,C,E,F,W,T4,B9",
		},
	}),
}

null_ls.setup({
	debug = true,
	sources = sources,
})
