require('utils.map-helpers')

-- Basic Remaps

vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })

nvmap({
	{"H", "^", { desc = "Start of Line"}},
	{"L", "$", { desc = "End of Line" }},
})

vim.api.nvim_create_user_command( 'Lsp', 'checkhealth vim.lsp', {desc = 'LSP Checkheath', nargs='*'})

vim.keymap.set('n', 'gK', function()
    local new_config = not vim.diagnostic.config().virtual_lines
    vim.diagnostic.config({ virtual_lines = new_config })
end, { desc = 'Toggle diagnostic virtual_lines' })

vim.keymap.set('i', '<C-j>', function()
  return vim.fn.pumvisible() == 1 and vim.keycode('<C-n>') or vim.keycode('<C-j>')
end, { expr = true, noremap = true })

vim.keymap.set('i', '<C-k>', function()
  return vim.fn.pumvisible() == 1 and vim.keycode('<C-p>') or vim.keycode('<C-k>')
end, { expr = true, noremap = true })
