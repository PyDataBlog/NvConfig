local autocmd = vim.api.nvim_create_autocmd
local opt = vim.opt

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
	pattern = "*",
	command = "tabdo wincmd =",
})

-- Number lines
opt.number = true
opt.relativenumber = true
