vim.pack.add({"https://github.com/L3MON4D3/LuaSnip"})

local ls = require("luasnip")

-- vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "jl", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "jp", function() ls.jump(-1) end, {silent = true})

-- vim.keymap.set({"i", "s"}, "<C-E>", function()
-- 	if ls.choice_active() then
-- 		ls.change_choice(1)
-- 	end
-- end, {silent = true})
