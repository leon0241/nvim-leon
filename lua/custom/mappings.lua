-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set({'n', 'v'}, 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set({'n', 'v'}, 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set({'n'}, '<leader>o', "o<Esc>", {desc = 'Add NL in normal mode'})
vim.keymap.set({'n'}, '<leader>O', "O<Esc>", {desc = 'Add NL above in normal mode'})

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

-- Hacky solution to get upper case hjkl in select mode
vim.keymap.set('s', 'H', 'h<Esc>~i', { desc = 'Upper case H'})
vim.keymap.set('s', 'J', 'j<Esc>~i', { desc = 'Upper case J'})
vim.keymap.set('s', 'j', 'j<Esc>a', { desc = 'lowercase j'})
vim.keymap.set('s', 'K', 'k<Esc>~i', { desc = 'Upper case K'})
vim.keymap.set('s', 'k', 'k<Esc>a', { desc = 'lowercase k'})
vim.keymap.set('s', 'L', 'l<Esc>~i', { desc = 'Upper case L'})

-- The classic insert mode shortcut
vim.keymap.set('i', 'jk', '<Esc>', { desc = 'Enter insert mode', nowait = true})
vim.keymap.set('i', 'j#', '<Esc>f$a', { desc = 'Go to end of LaTeX string'})
vim.keymap.set('n', 'te', 'f$a', { desc = 'Go to the end of a maths string' })

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

vim.keymap.set('n', '<Leader>L', '<Cmd>lua require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/LuaSnip/"})<CR>')


-- Zotero
vim.keymap.set('n', '<Leader>zf', '<Cmd> Telescope bibtex<CR>', { desc = "Find Zotero Citation"})






-- inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
--'.!inkscape-figures create "
--'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
-- nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>
vim.keymap.set(
  'i',
  '<C-f>',
  "<Esc><cmd> exec '.!inkscape-figures create \"'.getline('.').'\" \"'.b:vimtex.root.'/figures/\"'<CR><CR>:w<CR>'",
  {noremap = true}
)
-- LazyGit
vim.keymap.set('n', '<Leader>lg', '<cmd> LazyGit<CR>', { desc = 'Enter LazyGit'})

vim.keymap.set('n',  '<leader>p', '<cmd> lua require("nabla").popup()<CR>', {desc = 'nabla'})
