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



	-- Inequalites
	object("!=", "\\ne", "", in_mathzone),
	object(">=", "\\ge", "", in_mathzone),
	object("<=", "\\le", "", in_mathzone),
	object("===", "\\equiv", "", in_mathzone),
	object(">>", "\\gg", "", in_mathzone),
	object("<<", "\\ll", "", in_mathzone),
	object("~~", "\\sim", "", in_mathzone),
	object("\\sim~", "\\approx", "", in_mathzone),
	object("prop", "\\propto", "", in_mathzone),


	-- Arrows
	object("<->", "\\leftrightarrow ", "", in_mathzone),
	object("->", "\\to", "", in_mathzone),
	object("!>", "\\mapsto", "", in_mathzone),
	object("=>", "\\implies", "", in_mathzone),
	object("=<", "\\impliedby", "", in_mathzone),
	object("iff", "\\iff", "", in_mathzone),

	-- Set Theory
	object("Exts", "\\exists", "", in_mathzone),
	object("nExts", "\\nexists", "", in_mathzone),
	object("fAll", "\\forall", "", in_mathzone),
	object("sset", "\\subset", "", in_mathzone),
	object("spet", "\\supset", "", in_mathzone),
	object("inn", "\\in", "", in_mathzone),
	object("eqsset", "\\subseteq", "", in_mathzone),

	-- Separators
	object("para", "\\parallel", "", in_mathzone),
	object("|\\", "\\setminus", "", in_mathzone),
	object("||", "\\mid", "", in_mathzone),


	-- uhh logic and cap cup things
	object("cap", "\\cap", "", in_mathzone),
	object("cup", "\\cup", "", in_mathzone),
	object("VV", "\\vee", "", in_mathzone),
	object("NN", "\\wedge", "", in_mathzone),

	-- Dots
	object("...", "\\dots", "", in_mathzone),
	object("c..", "\\cdots", "", in_mathzone),
	object("v..", "\\vdots", "", in_mathzone),

	-- Random symbols
	object("prod", "\\prod", "", in_mathzone),
	object("log", "\\log", "", in_mathzone),
	-- object("pm", "\\pm", "", in_mathzone),
	object("mp", "\\mp", "", in_mathzone),
	object("Sq", "\\square", "", in_mathzone),
	object("nabl", "\\nabla", "", in_mathzone),
	object("del", "\\nabla", "", in_mathzone),
	object("xx", "\\times", "", in_mathzone),
	object("**", "\\cdot", "", in_mathzone),
	object("ell", "\\ell", "", in_mathzone),

	object("cos", "\\cos", "", in_mathzone),
	inner_snip("\\cosp", "\\cos(<>)","", in_mathzone),
	object("sin", "\\sin", "", in_mathzone),
	inner_snip("\\sinp", "\\sin(<>)","", in_mathzone),
	object("tan", "\\tan", "", in_mathzone),
	inner_snip("\\tanp", "\\tan(<>)","", in_mathzone),
}
