local ls = require 'luasnip'
local s = ls.snippet
local i = ls.insert_node
local fmta = require('luasnip.extras.fmt').fmta


local conditions = require('snippet-helpers.luasnip-conditions')
local funcs = require('snippet-helpers.luasnip-constructors')

local line_begin = conditions.line_begin
local in_mathzone = conditions.in_mathzone

local object = funcs.object
local inner_snip = funcs.inner_snip

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
	s(
		{trig = "opn", dscr="Operation", priority=-10},
		fmta(
			"<>: <> \\to <> ",
			{ i(1, "f"), i(2, "\\mathbb{N}"), i(3, "\\mathbb{R}")}
		),
		{condition = in_mathzone}
	),
	s(
		{trig = "xopn", dscr="Operation", priority=-10},
		fmta(
			"<>: <> \\times <> \\to <> ",
			{ i(1, "f"), i(2, "\\mathbb{N}"), i(3, "\\mathbb{N}"), i(4, "\\mathbb{R}")}
		),
		{condition = in_mathzone}
	),
	s(
		{trig = "basis", dscr="Basis"},
		fmta(
			"{}_{<>}[<>]_{<>}",
			{ i(1), i(2, "f"), i(3)}
		),
		{condition = in_mathzone}
	),
	s(
		{trig = "Repr", dscr="Representing Matrix"},
		fmta(
			"{}_{<>}[<>]",
			{ i(1), i(2, "f")}
		),
		{condition = in_mathzone}
	),
	s(
		{trig = "Genr", dscr="Submodule Generator"},
		fmta(
			"{}_{<>}\\langle <> \\rangle",
			{ i(1), i(2, "f")}
		),
		{condition = in_mathzone}
	),
}
