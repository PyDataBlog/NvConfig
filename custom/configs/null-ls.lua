local null_ls = require("null-ls")

local b = null_ls.builtins

local ruff_args = {
	"--select",
	"B,C,E,F,W,T4,B9,I001",
	"--ignore",
	"E203,E266,E501,W503,F403,F401,E712,C901,E402,F405",
	"--max-line-length",
	"120",
	"--per-file-ignores",
	"__init__.py:E402 **/{tests,docs,tools}/*:E402",
	"--isort",
	"--isort-known-third-party",
	"",
	"--isort-known-first-party",
	"",
	"--isort-sections",
	"FUTURE,STDLIB,THIRDPARTY,FIRSTPARTY,LOCALFOLDER",
}

local sources = {

	-- webdev stuff
	b.formatting.prettierd,
	b.formatting.prettier.with({ filetypes = { "html", "markdown", "css" } }), -- so prettier works only on these filetypes

	-- Lua
	b.formatting.stylua,

	-- cpp
	b.formatting.clang_format,

	--python
	b.formatting.black,
	b.diagnostics.ruff.with({ extra_args = ruff_args }),

	--bash
	b.diagnostics.shellcheck,

	--json & yaml
	b.diagnostics.jsonlint,
	b.diagnostics.yamllint,
}

null_ls.setup({
	debug = true,
	sources = sources,
})
