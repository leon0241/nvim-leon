-- Folding and UFO


require('ufo').setup({
  provider_selector = function(bufnr, filetype, buftype)
    return {'treesitter', 'indent'}
  end
})

-- Setup neovim lua configuration
require('lazydev').setup()

-- Treesitter
--
-- See `:help nvim-treesitter`
-- Defer Treesitter setup after first render to improve startup time of 'nvim {filename}'
vim.defer_fn(function()
  require("core.plugins.treesitter")
end, 0)

