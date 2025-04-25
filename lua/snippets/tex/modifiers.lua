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

-- Autosnippet array
local autosnippets = {}


-- Object Snippets
local mods = {
    {"vc", "\\vec{<>}"},
    {"bar", "\\overline{<>}"},
    {"hat", "\\hat{<>}"},
    {"udl", "\\underline{<>}"},
    {"tde", "\\tilde{<>}"},
}

for _, snip in ipairs(mods) do
    -- vc -> \vec{_}
    table.insert(autosnippets, visual_insert( snip[1], snip[2], "", in_mathzone
    ))

    -- avc -> \vec{a}
    table.insert(autosnippets, var_postfixer(snip[1], snip[2]:sub(1, -5), "", in_mathzone, 10
    ))
end

-- Object Snippets
local objects = {
    -- Superscript
    {"sr", "^{2}", 0},
    {"cb", "^{3}", 0},
    {"invs", "^{-1}", 0},
}

for _, snip in ipairs(objects) do
    table.insert(autosnippets, object(
	snip[1], snip[2], "", in_mathzone, snip[3])
    )
end

-- Snippets that end inside the completion
local inners = {
    {"rd", "^{<>}"},
    {"_", "_{<>}"},
    {"sq", "\\sqrt{<>}"},
    {"_{tx", "_{\\text{<>}"},
    {"^{tx", "^{\\text{<>}"},
}

for _, snip in ipairs(inners) do
    table.insert(autosnippets, inner_snip(
	snip[1], snip[2], "", in_mathzone)
    )
end

local manual_snippet_list = {
    -- Visual Insert Overbrace and Underbrace
    visual_insert_2("ubr", "\\underbrace{<>}_{<>}", "underbrace", in_mathzone),
    visual_insert_2("obr", "\\overbrace{<>}_{<>}", "underbrace", in_mathzone),

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

    -- Right arrow modify
    s(
	{trig="\\to>", dscr="rightarrow with text under/above"},
	fmta("\\prightarrow{<>}", { i(1)}),
	{condition = in_mathzone}
    ),
}

-- Combine automated lists with manual list
for _, snippet in ipairs(manual_snippet_list) do
    table.insert(autosnippets, snippet)
end

return {}, autosnippets
