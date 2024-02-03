local ls = require 'luasnip'
local s = ls.snippet
local i = ls.insert_node
local fmta = require('luasnip.extras.fmt').fmta


local conditions = require('snippet-helpers.luasnip-conditions')
local funcs = require('snippet-helpers.luasnip-constructors')

local line_begin = conditions.line_begin
local in_mathzone = conditions.in_mathzone

return {}, {
	s(
		{trig="mk", dscr="Expand Inline Math"},
		fmta("$<>$", { i(1) })
	),
	s(
		{trig="dm", dscr="Expand Math"},
		fmta("\\[<>\\]", { i(1) }),
		{condition = line_begin}
	),
	s(
		{trig = "set", dscr="Make a set"},
		fmta("\\{<>\\}", { i(1)}),
		{condition = in_mathzone}
	),
}
