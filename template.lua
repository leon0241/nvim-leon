local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local helper = require('luasnip-helper-funcs')
local fmta = require('luasnip.extras.fmt').fmta

local line_begin = require("luasnip.extras.expand_conditions").line_begin
local inMath = helper.in_mathzone

local snippet_list = {}





local manual_snippet_list = {}

-- Combine automated lists with manual list
for _, snippet in ipairs(manual_snippet_list) do
    table.insert(snippet_list, snippet)
end

return {}, snippet_list
