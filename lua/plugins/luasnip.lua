vim.pack.add({"https://github.com/L3MON4D3/LuaSnip", "https://github.com/benlubas/cmp2lsp"})

vim.pack.add({"https://github.com/saadparwaiz1/cmp_luasnip"})

require('cmp2lsp').setup({
    sources = {name = "cmp_luasnip"}
})

local ls = require("luasnip")

require("luasnip.loaders.from_lua").load({
    include = { "all", "tex", "lua"},
    paths = {"~/.config/nvim/lua/snippets"}
})

ls.setup({
    updateevents = "TextChanged,TextChangedI",
    enable_autosnippets = true,
    store_selection_keys = "<Tab>",
    ext_opts = {
        active = {
            hl_group = "red"
        },
        passive = {
            hl_group = "green"
        },
        visited = {
            hl_group = "yellow"
        },
        unvisited = {
            hl_group = "blue"
        }
    }
})

-- vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "jl", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "jp", function() ls.jump(-1) end, {silent = true})
