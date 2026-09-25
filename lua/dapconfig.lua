require('utils.map-helpers')

vim.pack.add({
    "https://github.com/mfussenegger/nvim-dap",
    "https://github.com/nvim-neotest/nvim-nio",
    "https://github.com/rcarriga/nvim-dap-ui",
    "https://github.com/theHamsta/nvim-dap-virtual-text",
    "https://github.com/jay-babu/mason-nvim-dap.nvim",

    "https://github.com/mfussenegger/nvim-dap-python",
})

require("mason-nvim-dap").setup()
require("dap-python").setup("python")

local Dap = require('dap')
local Dapui = require("dapui").setup()
local Dapvt = require("nvim-dap-virtual-text").setup()

-- Dap.configurations.python = {
--     {
--         type = 'debugpy';
--         request = 'launch';
--         name = "Launch file";
--         program = "${file}";
--         pythonPath = function()
--             return 'usr/bin/python'
--         end;
--     },
-- }
