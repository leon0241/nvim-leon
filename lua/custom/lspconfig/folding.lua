-- Tell the server the capability of foldingRange,
-- Neovim hasn't added foldingRange to default capabilities, users must add it manually
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

local language_servers = vim.lsp.get_clients() -- or list servers manually like {'gopls', 'clangd'}
for _, ls in ipairs(language_servers) do
  require('lspconfig')[ls].setup {
    capabilities = capabilities,
    -- you can add other fields for setting up lsp server in this table
  }
end

require('ufo').setup {
  provider_selector = function(bufnr, filetype, buftype)
    return { 'treesitter', 'indent' }
  end,

  -- Time between the range to be highlighted and to be cleared while opening the folded line, `0` disables
  open_fold_hl_timeout = 400,

  -- Folds to close by default when the file opens
  close_fold_kinds_for_ft = {},

  -- Enables a function to capture the virtual text for the folded lines
  enable_get_fold_virt_text = false,

  -- Configure the options for preview window and remap the keys for current buffer and preview buffer if the preview window is displayed
  preview = {
    win_config = {
      border = 'rounded',
      winblend = 12,
      winhighlight = 20,
      maxheight = 20,
    },
  },
}
