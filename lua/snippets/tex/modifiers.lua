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
local object = funcs.object

local snippet_list = {}

local manual_snippet_list = {

    object("sr", "^{2}", "square", in_mathzone),
    object("cb", "^{3}", "cube", in_mathzone),
    object("invs", "^{-1}", "inverse", in_mathzone),

    inner_snip("rd", "^{<>}", "Custom superscript", in_mathzone),
    inner_snip("_", "_{<>}", "Custom subscript", in_mathzone),
    inner_snip("sq", "\\sqrt{<>}", "Custom power", in_mathzone),

    object("xx", "\\times", "x times", in_mathzone),
    object("**", "\\cdot", "center dot", in_mathzone),
    object("...", "\\dots", "dots", in_mathzone),
    object("c..", "\\cdots", "center dots", in_mathzone),
    object("v..", "\\vdots", "vertical dots", in_mathzone),

    s(
	{trig="//", dscr="Fraction"},
	fmta(
	    "\\frac{<>}{<>}",
	    {i(1), i(2)}
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
	{trig="([%a%)%]%}])(%d)", regTrig=true, wordTrig=false, priority=-1, dscr="auto-indent variables"},
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
