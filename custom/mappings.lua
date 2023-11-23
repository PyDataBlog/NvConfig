local M = {}

M.copilot = {
	i = {
		["<C-l>"] = {
			function()
				vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
			end,
			"Copilot Accept",
			{ replace_keycodes = true, nowait = true, silent = true, expr = true, noremap = true },
		},
	},
}

M.dap = {
	plugin = true,
	n = {
		["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>", "Toggle breakpoint" },
		["<leader>dc"] = { "<cmd> DapContinue <CR>", "Continue" },
		["<leader>ds"] = { "<cmd> DapStepOver <CR>", "Step Over" },
		["<leader>di"] = { "<cmd> DapStepInto <CR>", "Step Into" },
		["<leader>do"] = { "<cmd> DapStepOut <CR>", "Step Out" },
		["<leader>dr"] = { "<cmd> DapRestart <CR>", "Restart" },
		["<leader>dq"] = { "<cmd> DapDisconnect <CR>", "Disconnect/Stop" },
		["<leader>df"] = { "<cmd>lua require('dap').continue()<cr>", "Start Debugging session" },
	},
}

M.neotest = {
	plugin = true,
	n = {
		["<leader>tm"] = { "<cmd>lua require('neotest').run.run()<cr>", "Test Method" },
		["<leader>tM"] = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", "Test Method DAP" },
		["<leader>tf"] = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<cr>", "Test Class" },
		["<leader>tF"] = {
			"<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>",
			"Test Class DAP",
		},
		["<leader>ts"] = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Test Summary" },
	},
}

M.iron = {
	plugin = true,
	n = {
		["<leader>sc"] = { "<cmd>lua require('iron').core.send_motion()<cr>", "Send Motion" },
		["<leader>sl"] = { "<cmd>lua require('iron').core.send_line()<cr>", "Send Line" },
		["<leader>sf"] = { "<cmd>lua require('iron').core.send_file()<cr>", "Send File" },
		["<leader>su"] = { "<cmd>lua require('iron').core.send_until_cursor()<cr>", "Send Until Cursor" },
		["<leader>sm"] = { "<cmd>lua require('iron').core.send_mark()<cr>", "Send Mark" },
		["<leader>mc"] = { "<cmd>lua require('iron').core.mark()<cr>", "Mark" },
		["<leader>md"] = { "<cmd>lua require('iron').core.unmark()<cr>", "Unmark" },
		["<leader>cl"] = { "<cmd>lua require('iron').core.clear_repl()<cr>", "Clear REPL" },
		["<leader>rs"] = { "<cmd>IronRepl<cr>", "Open REPL" },
		["<leader>rr"] = { "<cmd>IronRestart<cr>", "Restart REPL" },
	},
	v = {
		["<leader>sc"] = { ":lua require('iron').core.visual_send()<cr>", "Send Selection" },
	},
}

M.venv_selector = {
	plugin = true,
	n = {
		["<leader>vs"] = { "<cmd>:VenvSelect<cr>", "Open VenvSelector" },
		["<leader>vc"] = { "<cmd>:VenvSelectCached<cr>", "Retrieve cached Venv" },
	},
}

return M
