vim.pack.add({
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/nvim-treesitter/nvim-treesitter",
})

require('mason').setup()

-- Treesitter and folding
require('nvim-treesitter').install { 'python', 'lua'}

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

