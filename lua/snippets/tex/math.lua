local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta

local line_begin = require("luasnip.extras.expand_conditions").line_begin

local helper = require('luasnip-helper-funcs')
local inMath = helper.in_mathzone


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
		{condition = inMath}
	)
}
