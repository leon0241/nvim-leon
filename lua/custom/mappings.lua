-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set({ 'n', 'v' }, 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set({ 'n', 'v' }, 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set({ 'n' }, '<leader>o', 'o<Esc>', { desc = 'Add NL in normal mode' })
vim.keymap.set({ 'n' }, '<leader>O', 'O<Esc>', { desc = 'Add NL above in normal mode' })


-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })


-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Start and end of line
vim.keymap.set('n', 'L', '$', { desc = 'End of Line' })
vim.keymap.set('n', 'H', '^', { desc = 'Start of Line' })
vim.keymap.set('v', 'L', '$h', { desc = 'End of Line' })
vim.keymap.set('v', 'H', '^', { desc = 'Start of Line' })

-- God paste
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"_dhp', { desc = 'Start of Line' })

-- Center up and down page
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Down one screen and center' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Up one screen and center' })

-- Hacky solution to get upper case hjkl in select mode
vim.keymap.set('s', 'H', 'h<Esc>~i', { desc = 'Upper case H' })
vim.keymap.set('s', 'h', 'h<Esc>i', { desc = 'lowercase H' })
vim.keymap.set('s', 'J', 'j<Esc>~i', { desc = 'Upper case J' })
vim.keymap.set('s', 'j', 'j<Esc>a', { desc = 'lowercase j' })
vim.keymap.set('s', 'K', 'k<Esc>~i', { desc = 'Upper case K' })
vim.keymap.set('s', 'k', 'k<Esc>a', { desc = 'lowercase k' })
vim.keymap.set('s', 'L', 'l<Esc>~i', { desc = 'Upper case L' })
vim.keymap.set('s', 'l', 'l<Esc>i', { desc = 'lowercse L' })

-- The classic insert mode shortcut
vim.keymap.set('i', 'jk', '<Esc>', { desc = 'Enter insert mode', nowait = true })
vim.keymap.set('n', 'te', 'f$a', { desc = 'Go to the end of a maths string' })

-- NvimTree
vim.keymap.set('n', '<C-n>', '<cmd> NvimTreeToggle<CR>')

-- Window navigation
vim.keymap.set('n', '<C-h>', '<cmd> TmuxNavigateLeft<CR>', { desc = 'window left' })
vim.keymap.set('n', '<C-l>', '<cmd> TmuxNavigateRight<CR>', { desc = 'window right' })
vim.keymap.set('n', '<C-j>', '<cmd> TmuxNavigateDown<CR>', { desc = 'window down' })
vim.keymap.set('n', '<C-k>', '<cmd> TmuxNavigateUp<CR>', { desc = 'window up' })


-- UFO
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
vim.keymap.set('n', '<Leader>ft', "<Cmd> Format<CR>")


-- inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
--'.!inkscape-figures create "
--'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
-- nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>
vim.keymap.set(
  'i',
  '<C-f>',
  "<Esc><cmd> exec '.!inkscape-figures create \"'.getline('.').'\" \"'.b:vimtex.root.'/figures/\"'<CR><CR>:w<CR>'",
  { noremap = true }
)
-- LazyGit
vim.keymap.set('n', '<Leader>lg', function() Snacks.lazygit.open() end, { desc = 'Enter LazyGit' })
vim.keymap.set('n', '<Leader>lf', function() Snacks.lazygit.log() end, { desc = 'Enter LazyGit Log' })
vim.keymap.set('n', '<Leader>lo', function() Snacks.lazygit.log_file() end, { desc = 'Enter LazyGit Log on Current File' })

vim.keymap.set('n', '<leader>n', '<cmd> lua require("nabla").popup()<CR>', { desc = 'nabla' })

vim.keymap.set('n', '<Leader>L', '<Cmd>lua require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/LuaSnip/"})<CR>')
-- Buffers


-- Zotero
vim.keymap.set('n', '<Leader>zf', '<Cmd> Telescope bibtex<CR>', { desc = 'Find Zotero Citation' })


-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>?', function() Snacks.picker.recent() end, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', function() Snacks.picker.buffers() end, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>gf', function() Snacks.picker.git_files() end, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', function() Snacks.picker.files() end, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sG', function() Snacks.picker.git_grep() end, { desc = '[S]earch by [G]rep on Git Root' })
vim.keymap.set('n', '<leader>s/', function() Snacks.picker.grep_buffers() end, { desc = '[S]earch [/] in Open Files' })
vim.keymap.set('n', '<leader>sh', function() Snacks.picker.help() end, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', function() Snacks.picker.grep_word() end, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', function() Snacks.picker.grep() end, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', function() Snacks.picker.diagnostics() end, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', function() Snacks.picker.resume() end, { desc = '[S]earch [R]esume' })

-- vim.keymap.set('n', '<leader>ss', require('telescope.builtin').builtin, { desc = '[S]earch [S]elect Telescope' })
