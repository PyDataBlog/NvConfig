local M = {}

M.dap = {
    plugin = true,
    n = {
        ["<leader>db"] = {"<cmd> DapToggleBreakpoint <CR>", "Toggle breakpoint"},
        ["<leader>dc"] = {"<cmd> DapContinue <CR>", "Continue"},
        ["<leader>ds"] = {"<cmd> DapStepOver <CR>", "Step Over"},
        ["<leader>di"] = {"<cmd> DapStepInto <CR>", "Step Into"},
        ["<leader>do"] = {"<cmd> DapStepOut <CR>", "Step Out"},
        ["<leader>dr"] = {"<cmd> DapRestart <CR>", "Restart"},
        ["<leader>dq"] = {"<cmd> DapDisconnect <CR>", "Disconnect/Stop"},
        ["<leader>df"] = {"<cmd>lua require('dap').continue()<cr>", "Start Debugging session"}
    }
}

M.neotest = {
    plugin = true,
    n = {
        ["<leader>tm"] = {"<cmd>lua require('neotest').run.run()<cr>", "Test Method"},
        ["<leader>tM"] = {"<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", "Test Method DAP"},
        ["<leader>tf"] = {"<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<cr>", "Test Class"},
        ["<leader>tF"] = {"<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>",
                          "Test Class DAP"},
        ["<leader>ts"] = {"<cmd>lua require('neotest').summary.toggle()<cr>", "Test Summary"}
    }
}

return M
