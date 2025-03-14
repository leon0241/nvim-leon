-- Snippets
local ls = require 'luasnip'

require("luasnip.loaders.from_lua").load({
  include = { "all", "tex", "lua"},
  paths = {"~/.config/nvim/lua/snippets"}
})

require("luasnip").config.set_config({
  store_selection_keys = "<Tab>",
})

ls.setup({
  enable_autosnippets = true,
  store_selection_keys = "<Tab>",
  -- ext_opts = {
  --   active = {
  --     hl_group = "red"
  --   },
  --   passive = {
  --     hl_group = "green"
  --   },
  --   visited = {
  --     hl_group = "yellow"
  --   },
  --   unvisited = {
  --     hl_group = "blue"
  --   }
  -- }
})

-- Autocompletion
local cmp = require 'cmp'

cmp.setup {
  snippet = {
    expand = function(args)
      ls.lsp_expand(args.body)
    end,
  },
  completion = {
    completeopt = 'menu,menuone,noinsert',
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    -- AutoComplete select next item
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
    -- Snippet go next selector
    ['jl'] = cmp.mapping(function(fallback)
      if ls.expand_or_locally_jumpable() then
        ls.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    -- AutoComplete select previous item
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
    -- Snippet go back selector
    ['jp'] = cmp.mapping(function(fallback)
      if ls.locally_jumpable(-1) then
        ls.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'lazydev' },
    { name = 'path' },
  },
}
