require("utils.map-helpers")

vim.pack.add({
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/nvim-treesitter/nvim-treesitter",
})


require('mason').setup()

-- Treesitter and folding
require('nvim-treesitter').install { 'python', 'lua', 'rust'}

-- Treesitter highlighting on file open
vim.api.nvim_create_autocmd('FileType', {
  pattern = { '<filetype>' },
  callback = function() vim.treesitter.start() end,
})

vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldmethod = 'expr'

vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- Default to treesitter folding

vim.o.foldtext = ""
vim.opt.foldcolumn = "0"
vim.opt.fillchars:append({fold = " "})


-- LSP

vim.lsp.enable('emmylua_ls')
vim.lsp.enable('basedpyright')
vim.lsp.enable('ltex-ls-plus')
vim.lsp.enable('texlab')
vim.lsp.enable('rust-analyzer')

vim.lsp.codelens.enable(true)
vim.lsp.inlay_hint.enable(true)


-- On LSP Attach
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp_completion", { clear = true }),

    callback = function(args)
        local client_id = args.data.client_id
        if not client_id then
            return
        end

        local client = vim.lsp.get_client_by_id(client_id)
        -- Prefer LSP folding if client supports it
        if client:supports_method('textDocument/foldingRange') then

            local win = vim.api.nvim_get_current_win()

            vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"

        end

        local Dap, Dapui = require("dap"), require("dapui")
        -- DAP keybinds
        nmap{
            {"<Leader>db", function() Dap.toggle_breakpoint() end, {desc = "Debugger: Toggle Breakpoint"}},
            {"<Leader>dB", function() Dap.set_breakpoint() end, {desc = "Debugger: Set Breakpoint"}},
            {"<Leader>dp", function() Dap.run_last() end, {desc = "Debugger: Run Last"}},
            {"<Leader>dl", function() Dap.repl.open() end, {desc = "Debugger: Open Repl"}},

            {"<Leader>dc", function() Dap.continue() end, {desc = "Debugger: Continue"}},
            {"<Leader>dj", function() Dap.step_over() end, {desc = "Debugger: Step Over"}},
            {"<Leader>dl", function() Dap.step_into() end, {desc = "Debugger: Step Into"}},
            {"<Leader>dh", function() Dap.step_out() end, {desc = "Debugger: Step Out"}},

            {"<Leader>do", function() Dapui.open() end, {desc = "Debug UI: Open"}},
            {"<Leader>dx", function() Dapui.close() end, {desc = "Debug UI: Close"}},
            {"<Leader>dt", function() Dapui.close() end, {desc = "Debug UI: Toggle"}},
        }

        -- Auto open and close UI from Dap events
        Dap.listeners.before.attach.dapui_config = function()
            Dapui.open()
        end
        Dap.listeners.before.launch.dapui_config = function()
            Dapui.open()
        end
        Dap.listeners.before.event_terminated.dapui_config = function()
            Dapui.close()
        end
        Dap.listeners.before.event_exited.dapui_config = function()
            Dapui.close()
        end


        -- Rustacean specific keybinds
        local bufnr = args.buf
        if vim.bo[bufnr].filetype == "rust" then
            vim.keymap.set( "n", "gra",
                function()
                    vim.cmd.RustLsp('codeAction')
                end,
                { silent = true, buffer = bufnr }
            )
            vim.keymap.set( "n", "K", function()
                    vim.cmd.RustLsp({'hover', 'actions'})
                end, { silent = true, buffer = bufnr }
            )
        end
    end,
})




-- Native Autocompletion
-- if client and client:supports_method("textDocument/completion") then
--     -- Enable native LSP completion for this client + buffer
--     vim.lsp.completion.enable(true, client_id, args.buf, {
    --         autotrigger = true,   -- auto-show menu as you type (recommended)
    --         -- You can also set { autotrigger = false } and trigger manually with <C-x><C-o>
    --     })
    -- end

