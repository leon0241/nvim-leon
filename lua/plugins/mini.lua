require('utils.map-helpers')

vim.pack.add({'https://github.com/nvim-mini/mini.nvim',})

-- Status Column

local spec = {
    -- Prefer visible separator with a more efficient order to use
    -- usually present whitespace to the right of signs
    { format = '=lfs', sep = '▏' },
    -- Use custom symbol for virtual lines
    { ltype = 'virt', lnum = '•' },
    -- Use custom symbol for wrapped lines
    { ltype = 'wrap', lnum = '↳' },
    -- Hide separator to better indicate inactive windows
    { win = 'inactive', sep = ' ' },
}

local StatusColumn = require("mini.statuscolumn")

StatusColumn.setup({
    content = StatusColumn.gen_content.main(spec)
})

-- Mini Files
local Files = require('mini.files')
Files.setup()

nmap({
    { "<C-n>", function() Files.open() end, {desc = "Mini Files"} },
})

require('mini.pairs').setup()
