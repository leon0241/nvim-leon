-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set({'n', 'v'}, 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set({'n', 'v'}, 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Start and end of line
vim.keymap.set('n', 'L', '$', { desc = 'End of Line'})
vim.keymap.set('n', 'H', '^', { desc = 'Start of Line'})
vim.keymap.set('v', 'L', '$h', { desc = 'End of Line'})
vim.keymap.set('v', 'H', '^', { desc = 'Start of Line'})

-- The classic insert mode shortcut
vim.keymap.set('i', 'jk', '<Esc>', { desc = 'Enter insert mode', nowait = true})

-- NvimTree
vim.keymap.set('n', '<C-n>', '<cmd> NvimTreeToggle<CR>')

-- Window navigation
vim.keymap.set('n', '<C-h>', '<cmd> TmuxNavigateLeft<CR>', { desc = 'window left'})
vim.keymap.set('n', '<C-l>', '<cmd> TmuxNavigateRight<CR>', { desc = 'window right'})
vim.keymap.set('n', '<C-j>', '<cmd> TmuxNavigateDown<CR>', { desc = 'window down'})
vim.keymap.set('n', '<C-k>', '<cmd> TmuxNavigateUp<CR>', { desc = 'window up'})

-- Buffers
vim.keymap.set('n', '<Leader>fb', '<cmd> Telescope buffers<CR>', { desc = 'Telescope: View active buffers'})
vim.keymap.set('n', '<Leader>ff', '<cmd> Telescope find_files<CR>', { desc = 'Telescope: Find Files'})
vim.keymap.set('n', '<Leader>fg', '<cmd> Telescope live_grep<CR>', { desc = 'Telescope: Live grep'})

-- -- -- UltiSnips
-- vim.keymap.set('n', '<Tab>', '<cmd> UltiSnipsExpandTrigger', { desc = "Expand UltiSnips"})
-- vim.keymap.set('n', '<Tab>', '<cmd> UltiSnipsJumpForwardTrigger', { desc = "Expand UltiSnips"})
-- vim.keymap.set('n', 'S-<Tab>', '<cmd> UltiSnipsJumpBackwardsTrigger', { desc = "Expand UltiSnips"})

-- LazyGit
vim.keymap.set('n', '<Leader>lg', '<cmd> LazyGit<CR>', { desc = 'Enter LazyGit'})

vim.keymap.set('n',  '<leader>p', '<cmd> lua require("nabla").popup()<CR>', {desc = 'nabla'})
-- Customize with popup({border = ...})  : `single` (default), `double`, `rounded`
--
-- Neorg
-- vim.keymap.set('v', '<Leader>ml', 'S]', { desc = 'Neorg link WIP'})


-- Luasnip
-- local ls = require 'luasnip' 

-- vim.keymap.set({"i", "s"}, "<>", function()
-- 	if ls.choice_active() then
-- 		ls.change_choice(1)
-- 	end
-- end, {silent = true})
