local M = {}

M.setup = function()
	local Terminal = require("toggleterm.terminal").Terminal
	local htop = Terminal:new({ cmd = "htop", hidden = true, direction = "vertical" })
	local ipython = Terminal:new({ cmd = "ipython", hidden = true, direction = "vertical" })
	local julia = Terminal:new({ cmd = "julia", hidden = true, direction = "vertical" })
	local btop = Terminal:new({ cmd = "btop", hidden = true, direction = "vertical" })

	function _HTOP()
		htop:toggle()
	end

	function _IPYTHON()
		ipython:toggle()
	end

	function _JULIA()
		julia:toggle()
	end

	function _BTOP()
		btop:toggle()
	end

	require("toggleterm").setup({
		size = 80, -- size can be a number or function which is passed the current terminal
		open_mapping = [[\\]],
		hide_numbers = true, -- hide the number column in toggleterm buffers
		shade_filetypes = {},
		shading_factor = 1, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
		start_in_insert = true,
		insert_mappings = true, -- whether or not the open mapping applies in insert mode
		persist_size = true,
		direction = "vertical", -- 'vertical' | 'horizontal' | 'window' | 'float'
		close_on_exit = false, -- close the terminal window when the process exits
		shell = vim.o.shell, -- change the default shell
		-- Add specific terminal behavior
		on_open = function(term)
			vim.cmd("startinsert!")
			vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
		end,
		on_close = function(term)
			vim.cmd("stopinsert!")
		end,
	})
end

return M
