require('utils.map-helpers')

-- Basic Remaps

vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })

nvmap({
	{"H", "^", { desc = "Start of Line"}},
	{"j", "gj", { desc = "Start of Line"}},
	{"k", "gk", { desc = "End of Line" }},
    {'<leader>p', '"_dP', { desc = 'God Paste' }}
})

nmap({
	{"L", "$", { desc = "End of Line" }},

	{'<C-h>', '<cmd> TmuxNavigateLeft<CR>', { desc = 'window left' }},
	{'<C-l>', '<cmd> TmuxNavigateRight<CR>', { desc = 'window right' }},
	{'<C-j>', '<cmd> TmuxNavigateDown<CR>', { desc = 'window down' }},
	{'<C-k>', '<cmd> TmuxNavigateUp<CR>', { desc = 'window up' }},
})



vmap({
	{"L", "$h", { desc = "End of Line" }}, -- One back when in visual mode to not copy the linebreak
})

vim.api.nvim_create_user_command( 'Lsp', 'checkhealth vim.lsp', {desc = 'LSP Checkheath', nargs='*'})

vim.keymap.set('n', 'gK', function()
    local new_config = not vim.diagnostic.config().virtual_lines
    vim.diagnostic.config({ virtual_lines = new_config })
end, { desc = 'Toggle diagnostic virtual_lines' })
