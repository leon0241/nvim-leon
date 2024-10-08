vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.conceallevel = 1
vim.opt.foldlevelstart = 99

vim.opt.autochdir = true

vim.opt.wrap = true
vim.opt.linebreak = true

vim.opt.scrolloff = 7

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})

-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
vim.o.updatetime = 250
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
  callback = function ()
    vim.diagnostic.open_float(nil, {focus=false})
  end
})

-- [[ Configure nvim-cmp ]]
-- See `:help cmp`
local cmp = require 'cmp'
local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node


require('nvim-autopairs').setup({
  disable_filetype = { "tex" },
})

vim.g.vimtex_view_method = 'zathura'

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

ls.add_snippets("all", {
  s("hi", {
    t("hello world")
  })
})

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
    { name = 'path' },
  },
}





