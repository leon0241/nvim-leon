local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta


local conditions = require('snippet-helpers.luasnip-conditions')
local funcs = require('snippet-helpers.luasnip-constructors')

local line_begin = conditions.line_begin
local in_mathzone = conditions.in_mathzone

local inner_snip = funcs.inner_snip

local cond = function() return true end
return {}, {
	s(
		{trig="triggertest", dscr="test"},
		fmta("test<>", { i(1) }),
		{condition = cond}
	),
	s(
		{trig="dm", dscr="Expand Math"},
		fmta("\\[<>\\]", { i(1) }),
		{condition = cond}
	),
	s(
		{trig="mk", dscr="Expand Inline Math"},
		fmta("$<>$", { i(1) })
	),
	s(
		{trig = "set", dscr="Make a set"},
		fmta("\\{<>\\}", { i(1)}),
		{condition = in_mathzone}
	),
}
