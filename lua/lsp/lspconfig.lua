-- [[ Configure LSP ]]
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = require 'lsp.on_attach'
-- mason-lspconfig requires that these setup functions are called in this order before setting up the servers.
require('mason').setup()
require('mason-lspconfig').setup()

local servers = {
  -- clangd = {},
  -- gopls = {},
  -- pyright = {},
  -- rust_analyzer = {},
  -- tsserver = {},
  -- html = { filetypes = { 'html', 'twig', 'hbs'} },

  lua_ls = require 'lsp.servers.lua_ls',
  ltex = require 'lsp.servers.ltex',
}

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    }
  end,
}

require('mason-nvim-lint').setup()

-- Linting and formatting
require('lint').linters_by_ft = {
  python = { 'flake8' },
}

require('mason-conform').setup()

require('conform').setup {
  formatters_by_ft = {
    lua = { 'stylua' },

    tex = { 'latexindent' },
    -- Conform will run multiple formatters sequentially
    python = { 'isort', 'black' },
    -- You can customize some of the format options for the filetype (:help conform.format)
    rust = { 'rustfmt', lsp_format = 'fallback' },
    -- Conform will run the first available formatter
    javascript = { 'prettierd', 'prettier', stop_after_first = true },
  },
  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_format = 'fallback',
  -- },
}

vim.api.nvim_create_user_command('Format', function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ['end'] = { args.line2, end_line:len() },
    }
  end
  require('conform').format { async = true, lsp_format = 'fallback', range = range }
end, { range = true })

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
