-- [[ Configure LSP ]]
--  This function gets run when an LSP connects to a particular buffer.
-- mason-lspconfig requires that these setup functions are called in this order before setting up the servers.
require('mason').setup()

vim.lsp.config('*', {
  root_markers = { '.git', '.hg' },
})

vim.lsp.enable({
  'ltex',
  'lua_ls',
  'basedpyright',
  'rust-analyzer',
  'qmlls'
})


require('custom.lspconfig.linter')


require('custom.lspconfig.formatter')


require('custom.lspconfig.autocomplete')


-- LSP On attach commands is configured in mappings.lua
