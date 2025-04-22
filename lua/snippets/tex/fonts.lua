-- Import helper functions
local conditions = require('snippet-helpers.luasnip-conditions')
local funcs = require('snippet-helpers.luasnip-constructors')

-- Line conditions
local line_begin = conditions.line_begin
local in_mathzone = conditions.in_mathzone
local in_text = conditions.in_text
local f = require("luasnip").function_node
local s = require("luasnip").snippet
local fmta = require('luasnip.extras.fmt').fmta
local i = require('luasnip').insert_node
local rep = require("luasnip.extras").rep

-- Constructor functions
local inner_snip = funcs.inner_snip
local visual_insert = funcs.visual_insert
local visual_insert_2 = funcs.visual_insert_2
local object = funcs.object
local mbb_super_sub = funcs.mbb_super_sub
local general_super_sub = funcs.general_super_sub
local mathbb_snippet = funcs.mathbb_snippet
local var_postfixer = funcs.var_postfixer
local postfix = require('luasnip.extras.postfix').postfix

local autosnippets = {}
local mathbb_letters = {"R", "N", "Q", "Z", "C", "E", "P", "1"}

-- Inserts all regular mathBBs into a table
for _, letter in ipairs(mathbb_letters) do
    table.insert(autosnippets, mathbb_snippet(letter))
end

-- Math Fonts
local math_fonts = {
    {"rm", "\\mathrm{<>}", true},
    {"it", "\\mathit{<>}", false},
    {"bf", "\\mathbf{<>}", false},
    {"tt", "\\mathtt{<>}", false},
    {"mc", "\\mathcal{<>}", true},
    {"bb", "\\mathbb{<>}", true},
    {"scr", "\\mathscr{<>}", true}
}

for _, snip in ipairs(math_fonts) do
    -- bb -> \mathbb{_}
    table.insert(autosnippets, visual_insert( snip[1], snip[2], "", in_mathzone
    ))

    -- If snip true then put a postfixer, output slice off final 5 chars
    -- abb -> \mathbb{a}
    if snip[3] == true then
	table.insert(autosnippets, var_postfixer(snip[1], snip[2]:sub(1, -5), "", in_mathzone, 10
	))
    end
end

-- superscript and subscript mathBBs
local manual_snippet_list = {
    mbb_super_sub("R", "2", "^"),
    mbb_super_sub("R", "3", "^"),
    mbb_super_sub("R", "n", "^"),
    mbb_super_sub("R", "n", "^"),

    mbb_super_sub("Z", "+", "^"),
    mbb_super_sub("Z", "-", "^"),

    mbb_super_sub("N", "0", "_"),
    general_super_sub("\\ell", "1", "_"),


    object("dss", "\\displaystyle", "displaystyle", in_mathzone),
    inner_snip("text", "\\text{<>}", "text module", in_mathzone),
    inner_snip("label", "\\label{<>}", "label module", in_mathzone),
    s({trig = "labtag"},
	fmta( "\\label{<>}\\tag{<>}", { i(1, "name"), rep(1) })
    ),

    object(",,", ",\\,", "comma space", in_mathzone),
    object(";;", ",\\;\\quad", "comma semi", in_mathzone),
    object(",.,", ",\\dots,", "comma space", in_mathzone),
    object("..", "\\dots", "dots", in_mathzone),
    object("c..", "\\cdots", "centered dots", in_mathzone, 5),
    object("v..", "\\vdots", "vertical dots", in_mathzone, 5),
    object("quad", "\\quad", "quad", in_mathzone),
    object("qquad", "\\qquad", "qquad", in_mathzone, 5),
    object("vsm", "\\vspace{-5pt}", "qquad"),

    -- Post fixing this guy
    object("\\mathscr{}i", "scri", "Mathscript", in_mathzone),
    -- Post fixing this guy
    object("\\\\inte", "\\inte", "Interrupt fix", in_mathzone),

}

-- Combine automated lists with manual list
for _, snippet in ipairs(manual_snippet_list) do
    table.insert(autosnippets, snippet)
end

-- Regular snippets
local snippets = {
    visual_insert_2("texstring", "\\texorpdfstring{$<>$}{<>}", "Add a Tex or PDF String", in_mathzone),
}

return snippets, autosnippets
