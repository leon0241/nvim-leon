require('utils.map-helpers')

vim.pack.add({'https://github.com/folke/snacks.nvim'})

local Snacks = require("snacks")

Snacks.setup({
    picker = {
        enabled = "true",
        files = {
            ignored = true,
        }
    },
    lazygit = {enabled = "true"},
})

nmap({
    { "<leader>ff", function() Snacks.picker.files() end, {desc = "Find Files"} },
    { "<leader>/", function() Snacks.picker.grep() end, {desc = "Grep"} },
    {"<Leader> ", function() Snacks.picker.buffers() end, { desc = 'Find open buffers' }},

    {"<Leader>lg", function() Snacks.lazygit.open() end, { desc = '[L]azy [G]it' }}
})
