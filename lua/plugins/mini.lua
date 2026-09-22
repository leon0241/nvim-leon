vim.pack.add({
	'https://github.com/nvim-mini/mini.nvim',
})


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

vim.opt.number = true
local StatusColumn = require("mini.statuscolumn")

StatusColumn.setup({
    content = StatusColumn.gen_content.main(spec)
})

require('mini.pairs').setup()
