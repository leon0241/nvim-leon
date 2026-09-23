require('utils.map-helpers')

vim.pack.add({'https://github.com/folke/snacks.nvim'})

local Snacks = require("snacks")

Snacks.setup({
    picker = {
        enabled = "true",
        files = {
            ignored = true,
        }
    }
})

nmap({
    { "<leader>ff", function() Snacks.picker.files() end, {desc = "Find Files"} },
    { "<leader>/", function() Snacks.picker.grep() end, {desc = "Grep"} },
})
