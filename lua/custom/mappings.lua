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
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"_dP', { desc = 'God Paste' })

-- Center up and down page
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Down one screen and center' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Up one screen and center' })


vim.keymap.set('n', '<Leader>u', "<Cmd> earlier 2s<CR>", { desc = 'Go back 2 seconds'})

vim.keymap.set('n', '<C-w><C-l>', '<C-w>v<C-w>l', { desc = 'Split to the right' })
vim.keymap.set('n', '<C-w><C-h>', '<C-w>v', { desc = 'Split to the left' })
vim.keymap.set('n', '<C-w><C-j>', '<C-w>s<C-w>j', { desc = 'Split down' })
vim.keymap.set('n', '<C-w><C-k>', '<C-w>s', { desc = 'Split up' })

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

-- vim.keymap.set('n', '<leader>n', '<cmd> lua require("nabla").popup()<CR>', { desc = 'nabla' })
--
vim.keymap.set('n', '<Leader>L', '<Cmd>lua require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/LuaSnip/"})<CR>')
-- -- Buffers


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

-- Lazy
vim.keymap.set('n', '<Leader>lg', function() Snacks.lazygit.open() end, { desc = '[L]azy [G]it' })
vim.keymap.set('n', '<Leader>lo', function() Snacks.lazygit.log() end, { desc = '[L]azyGit L[o]g' })
vim.keymap.set('n', '<Leader>lc', function() Snacks.lazygit.log_file() end, { desc = '[L]azyGit Log on [C]urrent File' })

-- Live Grep
vim.keymap.set('n', '<leader>sG', function() Snacks.picker.git_grep() end, { desc = '[S]earch by [G]rep on Git Root' })
vim.keymap.set('n', '<leader>s/', function() Snacks.picker.grep_buffers() end, { desc = '[S]earch [/] in Open Files' })
vim.keymap.set('n', '<leader>sw', function() Snacks.picker.grep_word() end, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', function() Snacks.picker.grep() end, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sl', function() Snacks.picker.lines() end, { desc = '[S]earch by [L]ines' })

-- Files
vim.keymap.set('n', '<leader><space>', function() Snacks.picker.buffers() end, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>ff', function() Snacks.picker.files() end, { desc = '[F]ind [F]ile' })
vim.keymap.set('n', '<leader>fg', function() Snacks.picker.git_files() end, { desc = '[F]ind [G]it file' })
vim.keymap.set('n', '<leader>?', function() Snacks.picker.recent() end, { desc = '[?] Find recently opened files' })

-- Other
vim.keymap.set('n', '<leader>sh', function() Snacks.picker.help() end, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sd', function() Snacks.picker.diagnostics() end, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', function() Snacks.picker.resume() end, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>sn', function() Snacks.picker.notifications() end, { desc = '[S]earch [N]otifications' })



local dap = require 'dap'
local dapui = require 'dapui'

-- Basic debugging keymaps, feel free to change to your liking!
vim.keymap.set('n', '<F5>', function() dap.continue() end, { desc = 'Debug: Start/Continue' })
vim.keymap.set('n', '<F1>', function() dap.step_into() end, { desc = 'Debug: Step Into' })
vim.keymap.set('n', '<F2>', function() dap.step_over() end, { desc = 'Debug: Step Over' })
vim.keymap.set('n', '<F3>', function() dap.step_out() end, { desc = 'Debug: Step Out' })
vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
vim.keymap.set('n', '<leader>B', function()
    dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
end, { desc = 'Debug: Set Breakpoint' })

-- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
vim.keymap.set('n', '<leader>dt', function() dapui.toggle() end, { desc = 'Toggle DAP UI' })



-- Trouble
vim.keymap.set('n', '<leader>xx', "<cmd>Trouble diagnostics toggle<cr>", { desc = 'Diagnostics (Trouble)' })
vim.keymap.set('n', '<leader>xX', "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = 'Buffer Diagnostics (Trouble).' })

-- LSP On Attach
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(event)
        local nmap = function(keys, func, desc)
            if desc then
                desc = 'LSP: ' .. desc
            end

            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = desc })
        end

        nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')


        -- "grn" is mapped in Normal mode to |vim.lsp.buf.rename()|
        -- "gra" is mapped in Normal and Visual mode to |vim.lsp.buf.code_action()|
        -- "grr" is mapped in Normal mode to |vim.lsp.buf.references()|
        -- "gri" is mapped in Normal mode to |vim.lsp.buf.implementation()|
        -- "grt" is mapped in Normal mode to |vim.lsp.buf.type_definition()|
        -- "gO" is mapped in Normal mode to |vim.lsp.buf.document_symbol()|

        nmap('gd', function () Snacks.picker.lsp_definitions() end, '[G]oto [D]efinition')
        nmap('gr', function () Snacks.picker.lsp_references() end, '[G]oto [R]eferences')
        nmap('gI', function () Snacks.picker.lsp_implementations() end, '[G]oto [I]mplementation')
        nmap('<leader>D', function () Snacks.picker.lsp_type_definitions() end, 'Type [D]efinition')
        nmap('<leader>ds', function () Snacks.picker.lsp_symbols() end, '[D]ocument [S]ymbols')
        nmap('<leader>ws', function () Snacks.picker.lsp_workspace_symbols() end, '[W]orkspace [S]ymbols')

        -- See `:help K` for why this keymap
        nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
        nmap('<C-S-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

        -- Lesser used LSP functionality
        nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
        nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
        nmap('<leader>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, '[W]orkspace [L]ist Folders')

        -- -- Create a command `:Format` local to the LSP buffer
        -- vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        --   vim.lsp.buf.format()
        -- end, { desc = 'Format current buffer with LSP' })
    end,
})
