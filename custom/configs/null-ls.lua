local null_ls = require "null-ls"

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.prettierd,
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,

  --python
  b.formatting.black,
  b.diagnostics.ruff,

  --bash
  b.diagnostics.shellcheck,

  --json & yaml
  b.diagnostics.jsonlint,
  b.diagnostics.yamllint,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
