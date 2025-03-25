local ls = require 'luasnip'
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node
local fmta = require('luasnip.extras.fmt').fmta


local conditions = require('snippet-helpers.luasnip-conditions')
local funcs = require('snippet-helpers.luasnip-constructors')
local postfix = require('luasnip.extras.postfix').postfix

local line_begin = conditions.line_begin
local in_mathzone = conditions.in_mathzone

local object = funcs.object
local var_postfixer = funcs.var_postfixer
local inner_snip = funcs.inner_snip


local objects = {
    {"!=", "\\ne"},
    {">=", "\\ge"},
    {"<=", "\\le"},
    {"===", "\\equiv"},
    {">>", "\\gg"},
    {"<<", "\\ll"},
    {"~~", "\\sim"},
    {"\\sim~", "\\approx"},
    {"~=", "\\simeq"},
    {"prop", "\\propto"},
    {"ideal", "\\unlhd"},

    -- Arrows
    {"<->", "\\leftrightarrow "},
    {"->", "\\to"},
    {"!>", "\\mapsto"},
    {"=>", "\\implies"},
    {"=<", "\\impliedby"},
    {"|=", "\\models"},
    {"iff", "\\iff"},

    -- Set Theory
    {"Exts", "\\exists"},
    {"nExts", "\\nexists"},
    {"fAll", "\\forall"},
    {"sst", "\\subset"},
    {"spt", "\\supset"},
    {"inn", "\\in"},
    {"\\subsetq", "\\subseteq"},
    {"\\subseteqq", "\\sqsubseteq"},
    {"ntri", "\\lhd"},
    {"fAe", "\\forall\\epsilon"},
    {"tEd", "\\exists\\delta"},
    {"fAx", "\\forall x"},


    -- Separators
    {"para", "\\parallel"},
    {"|\\", "\\setminus"},
    {"||", "\\mid"},


    -- uhh logic and cap cup things
    {"cap", "\\cap"},
    {"\\capq", "\\sqcap"},
    {"cup", "\\cup"},
    {"\\cupq", "\\sqcup"},
    {"VV", "\\vee"},
    {"NN", "\\wedge"},

    -- Random symbols
    {"prod", "\\prod"},
    {"log", "\\log"},
    {"mp", "\\mp"},
    {"Sq", "\\square"},
    {"nabl", "\\nabla"},
    {"del", "\\nabla"},
    {"xx", "\\times"},
    {"**", "\\cdot"},
    {"ell", "\\ell"},
    {"e\\mpt", "\\emptyset"},
    {"\\\\\\", "\\backslash"},


    -- Random operators
    {"pi", "\\pi"},
    {"det", "\\det"},
    {"sgn", "\\sgn"},
    {"Mat", "\\Mat"},
    {"cos", "\\cos"},
    {"sin", "\\sin"},
    {"tan", "\\tan"},
}

local manual_snips = {
    -- Right arrow modify
    s(
	{trig="\\to>", dscr="rightarrow with text under/above"},
	fmta("\\prightarrow{<>}", { i(1)}),
	{condition = in_mathzone}
    ),

    -- Subgroup
    postfix("sg", {
	f(function(_, parent)
	    return parent.snippet.env.POSTFIX_MATCH:sub(1, -2) .. "$" .. parent.snippet.env.POSTFIX_MATCH:sub(-1) .. "$-subgroup"
	end, {}),
    },
    { condition = not in_mathzone }
    ),

    inner_snip("\\sinp", "\\sin(<>)","", in_mathzone),
    inner_snip("\\cosp", "\\cos(<>)","", in_mathzone),
    inner_snip("\\tanp", "\\tan(<>)","", in_mathzone),

    -- Process Algebras
    inner_snip("trans", "\\trans{<>}","", in_mathzone),

    -- Phrases
    object("F-module", "$F$-module", ""),
    object("R-module", "$R$-module", ""),
}

local autosnips = {}

for _, snip in ipairs(objects) do
    table.insert(
	autosnips, object(snip[1], snip[2], "", in_mathzone)
    )
end

for _, snip in ipairs(manual_snips) do
    table.insert(
	autosnips, snip
    )
end

return {}, autosnips
