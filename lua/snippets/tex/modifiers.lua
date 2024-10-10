local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local f = ls.function_node
local i = ls.insert_node
local fmta = require('luasnip.extras.fmt').fmta


local conditions = require('snippet-helpers.luasnip-conditions')
local funcs = require('snippet-helpers.luasnip-constructors')

local in_mathzone = conditions.in_mathzone
local inner_snip = funcs.inner_snip
local visual_insert = funcs.visual_insert
local visual_insert_2 = funcs.visual_insert_2
local var_postfixer = funcs.var_postfixer
local object = funcs.object

local snippet_list = {}

local manual_snippet_list = {

    object("sr", "^{2}", "square", in_mathzone),
    object("cb", "^{3}", "cube", in_mathzone),
    object("invs", "^{-1}", "inverse", in_mathzone),

    -- x and y abbreviations
    object("xnn", "x_{n}", "x to the n", in_mathzone),
    object("ynn", "y_{n}", "y to the n", in_mathzone),
    object("fxx", "f(x)", "f(x)", in_mathzone, 10),
    object("gxx", "g(x)", "f(x)", in_mathzone, 10),
    object("fnn", "f_{n}", "f(n)", in_mathzone, 10),
    object("fnx", "f_{n}(x)", "f(n)", in_mathzone, 10),
    object("cfn", "(f_{n})", "f(n)", in_mathzone, 10),
    object("zxf", "f(x_{0})", "f(x_0)", in_mathzone, 10), -- not consistent but rolls off the hand easier
    object("fyy", "f(y)", "f(y)", in_mathzone, 10),

    -- set theory notation
    object("fAe", "\\forall\\epsilon", "for all epsilon", in_mathzone),
    object("tEd", "\\exists\\delta", "there exists a delta", in_mathzone),
    object("fAx", "\\forall x", "for all x", in_mathzone),

    -- open balls
    object("BX", "B_{X}", "Open ball X", in_mathzone, 10),
    object("BY", "B_{Y}", "Open ball Y", in_mathzone, 10),


    inner_snip("rd", "^{<>}", "Custom superscript", in_mathzone),
    inner_snip("_", "_{<>}", "Custom subscript", in_mathzone),
    inner_snip("sq", "\\sqrt{<>}", "Custom power", in_mathzone),

    visual_insert("vc", "\\vec{<>}", "vector", in_mathzone),
    visual_insert("bar", "\\overline{<>}", "vector", in_mathzone),
    visual_insert("hat", "\\hat{<>}", "vector", in_mathzone),
    visual_insert("udl", "\\underline{<>}", "vector", in_mathzone),
    visual_insert("tde", "\\tilde{<>}", "vector", in_mathzone),


    var_postfixer("vc", "\\vec", "Postfix Variable to vector", in_mathzone, 10),
    var_postfixer("bar", "\\overline", "Postfix Variable to overbar", in_mathzone, 10),
    var_postfixer("hat", "\\hat", "Postfix Variable to hat", in_mathzone, 10),
    var_postfixer("udl", "\\underline", "Postfix Variable to underline", in_mathzone, 10),
    var_postfixer("tde", "\\tilde", "Postfix Variable to tilde", in_mathzone, 10),


    object("vvc", "\\vec{v}", "v vector", in_mathzone, 10),
    object("0vc", "\\vec{0}", "v vector", in_mathzone, 10),

    visual_insert_2("ubr", "\\underbrace{<>}_{<>}", "underbrace", in_mathzone),
    visual_insert_2("obr", "\\overbrace{<>}_{<>}", "underbrace", in_mathzone),

    inner_snip("_{tx", "_{\\text{<>}", "add text to subscripts", in_mathzone),
    inner_snip("^{tx", "^{\\text{<>}", "add text to superscripts", in_mathzone),

    s(
	{trig="tb", dscr="Top and bottom variable", wordTrig=false},
	fmta(
	    "^{<>}_{<>}",
	    {i(1), i(2)}
	),
	{ condition = in_mathzone}
    ),
    s(
	{trig="//", dscr="Fraction", wordTrig=false},
	fmta(
	    "\\frac{<>}{<>}",
	    {i(1), i(2)}
	),
	{ condition = in_mathzone}
    ),
    s(
	{trig="([\\%{%}%(%)%w]+)%/", dscr="Auto expand first fraction", wordTrig=false, regTrig=true},
	fmta(
	    "\\frac{<>}{<>}",
	    {
		f( function(_, snip) return snip.captures[1] end ),
		i(1)
	    }
	),
	{ condition = in_mathzone}
    ),


    s(
	{trig="(%_%{%d*)%}(%d)", regTrig=true, wordTrig=false, priority=10, dscr="auto-indent variables"},
	fmta(
	    "<><>}",
	    {
		f( function(_, snip) return snip.captures[1] end),
		f( function(_, snip) return snip.captures[2] end),
	    }
	),
	{ condition = in_mathzone}
    ),
    s(
	{trig="([%a%)%]%}])(%d)", regTrig=true, wordTrig=false, priority=-1, dscr="auto-indent variables 2"},
	fmta(
	    "<>_{<>}",
	    {
		f( function(_, snip) return snip.captures[1] end),
		f( function(_, snip) return snip.captures[2] end),
	    }
	),
	{ condition = in_mathzone}
    ),
}

-- Combine automated lists with manual list
for _, snippet in ipairs(manual_snippet_list) do
    table.insert(snippet_list, snippet)
end

return {}, snippet_list
