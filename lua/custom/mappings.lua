-- Keymaps for better default experience

local n_mapper = function(keys, func, mods)
  vim.keymap.set({ 'n' }, keys, func, mods)
end

local v_mapper = function(keys, func, mods)
  vim.keymap.set({ 'v' }, keys, func, mods)
end

local nv_mapper = function(keys, func, mods)
  vim.keymap.set({ 'n', 'v' }, keys, func, mods)
end

-- See `:help vim.keymap.set()`
nv_mapper('<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
nv_mapper('k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
nv_mapper('j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

n_mapper('<leader>o', 'o<Esc>', { desc = 'Add NL in normal mode' })
n_mapper('<leader>O', 'O<Esc>', { desc = 'Add NL above in normal mode' })

nv_mapper('<Space>', '<Nop>', { silent = true })

-- Diagnostic keymaps
n_mapper('[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
n_mapper(']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
n_mapper('<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
n_mapper('<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Start and end of line
n_mapper('L', '$', { desc = 'End of Line' })
n_mapper('H', '^', { desc = 'Start of Line' })
v_mapper('L', '$h', { desc = 'End of Line' })
v_mapper('H', '^', { desc = 'Start of Line' })

-- God paste
nv_mapper('<leader>p', '"_dP', { desc = 'God Paste' })

-- Center up and down page
n_mapper('<C-d>', '<C-d>zz', { desc = 'Down one screen and center' })
n_mapper('<C-u>', '<C-u>zz', { desc = 'Up one screen and center' })

n_mapper('<Leader>u', '<Cmd> earlier 2s<CR>', { desc = 'Go back 2 seconds' })

n_mapper('<C-w><C-l>', '<C-w>v<C-w>l', { desc = 'Split to the right' })
n_mapper('<C-w><C-h>', '<C-w>v', { desc = 'Split to the left' })
n_mapper('<C-w><C-j>', '<C-w>s<C-w>j', { desc = 'Split down' })
n_mapper('<C-w><C-k>', '<C-w>s', { desc = 'Split up' })

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
n_mapper('te', 'f$a', { desc = 'Go to the end of a maths string' })

-- NvimTree
n_mapper('<C-n>', '<cmd> NvimTreeToggle<CR>')

-- Window navigation
n_mapper('<C-h>', '<cmd> TmuxNavigateLeft<CR>', { desc = 'window left' })
n_mapper('<C-l>', '<cmd> TmuxNavigateRight<CR>', { desc = 'window right' })
n_mapper('<C-j>', '<cmd> TmuxNavigateDown<CR>', { desc = 'window down' })
n_mapper('<C-k>', '<cmd> TmuxNavigateUp<CR>', { desc = 'window up' })

-- -- UFO
-- n_mapper('zR', require('ufo').openAllFolds)
-- n_mapper('zM', require('ufo').closeAllFolds)
n_mapper('<Leader>ft', '<Cmd> Format<CR>')

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

-- vim.keymap.set('n', '<leader>n', '<cmd> lua require("nabla").popup()<CR>', { desc = 'nabla' })
--
n_mapper('<Leader>L', '<Cmd>lua require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/LuaSnip/"})<CR>')
-- -- Buffers

-- Zotero
n_mapper('<Leader>zf', '<Cmd> Telescope bibtex<CR>', { desc = 'Find Zotero Citation' })

-- See `:help telescope.builtin`
n_mapper('<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

local n_snacker = function(keys, func, mods)
  vim.keymap.set({ 'n' }, keys, function()
    func()
  end, mods)
end

-- Lazy
n_snacker('<Leader>lg', Snacks.lazygit.open, { desc = '[L]azy [G]it' })
n_snacker('<Leader>lo', Snacks.lazygit.log, { desc = '[L]azyGit L[o]g' })
n_snacker('<Leader>lc', Snacks.lazygit.log_file, { desc = '[L]azyGit Log on [C]urrent File' })

-- Live Grep
n_snacker('<leader>sG', Snacks.picker.git_grep, { desc = '[S]earch by [G]rep on Git Root' })
n_snacker('<leader>s/', Snacks.picker.grep_buffers, { desc = '[S]earch [/] in Open Files' })
n_snacker('<leader>sw', Snacks.picker.grep_word, { desc = '[S]earch current [W]ord' })
n_snacker('<leader>sg', Snacks.picker.grep, { desc = '[S]earch by [G]rep' })
n_snacker('<leader>sl', Snacks.picker.lines, { desc = '[S]earch by [L]ines' })

-- Files
n_snacker('<leader><space>', Snacks.picker.buffers, { desc = '[ ] Find existing buffers' })
n_snacker('<leader>ff', Snacks.picker.files, { desc = '[F]ind [F]ile' })
n_snacker('<leader>fg', Snacks.picker.git_files, { desc = '[F]ind [G]it file' })
n_snacker('<leader>?', Snacks.picker.recent, { desc = '[?] Find recently opened files' })

-- Other
n_snacker('<leader>sh', Snacks.picker.help, { desc = '[S]earch [H]elp' })
n_snacker('<leader>sd', Snacks.picker.diagnostics, { desc = '[S]earch [D]iagnostics' })
n_snacker('<leader>sr', Snacks.picker.resume, { desc = '[S]earch [R]esume' })
n_snacker('<leader>sn', Snacks.picker.notifications, { desc = '[S]earch [N]otifications' })

local dap = require 'dap'
local dapui = require 'dapui'

local n_dapper = function(keys, func, mods)
  vim.keymap.set({ 'n' }, keys, function()
    func()
  end, mods)
end

-- Basic debugging keymaps, feel free to change to your liking!
n_dapper('<F5>', dap.continue, { desc = 'Debug: Start/Continue' })
n_dapper('<F1>', dap.step_into, { desc = 'Debug: Step Into' })
n_dapper('<F2>', dap.step_over, { desc = 'Debug: Step Over' })
n_dapper('<F3>', dap.step_out, { desc = 'Debug: Step Out' })
n_dapper('<leader>b', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })

n_mapper('<leader>B', function()
  dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
end, { desc = 'Debug: Set Breakpoint' })

-- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
n_mapper('<leader>dt', function()
  dapui.toggle()
end, { desc = 'Toggle DAP UI' })

-- Trouble
n_mapper('<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', { desc = 'Diagnostics (Trouble)' })
n_mapper('<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', { desc = 'Buffer Diagnostics (Trouble).' })

-- LSP On Attach
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    local lsp_map = function(keys, func, desc)
      if desc then
        desc = 'LSP: ' .. desc
      end

      vim.keymap.set('n', keys, func, { buffer = event.buf, desc = desc })
    end

    -- "grn" = vim.lsp.buf.rename()
    -- "gra" = vim.lsp.buf.code_action()
    -- "grr" = vim.lsp.buf.references()
    -- "gri" = vim.lsp.buf.implementation()
    -- "grt" = vim.lsp.buf.type_definition()
    -- "gO" = vim.lsp.buf.document_symbol()

    lsp_map('grd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    lsp_map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

    lsp_map('grw', function()
      Snacks.picker.lsp_workspace_symbols()
    end, '[W]orkspace [S]ymbols')
    -- lsp_map('gr', function() vim.lsp.buf.references() end, '[G]oto [R]eferences')
    -- lsp_map('gI', function() Snacks.picker.lsp_implementations() end, '[G]oto [I]mplementation')
    -- lsp_map('<leader>D', function() Snacks.picker.lsp_type_definitions() end, 'Type [D]efinition')
    -- lsp_map('<leader>ds', function() Snacks.picker.lsp_symbols() end, '[D]ocument [S]ymbols')
    -- lsp_map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    -- lsp_map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

    -- Lesser used LSP functionality
    lsp_map('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    lsp_map('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    lsp_map('<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[W]orkspace [L]ist Folders')
  end,
})
