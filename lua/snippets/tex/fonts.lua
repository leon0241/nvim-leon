-- Import helper functions
local conditions = require('snippet-helpers.luasnip-conditions')
local funcs = require('snippet-helpers.luasnip-constructors')

-- Line conditions
local line_begin = conditions.line_begin
local in_mathzone = conditions.in_mathzone
local in_text = conditions.in_text
local f = require("luasnip").function_node

-- Constructor functions
local inner_snip = funcs.inner_snip
local visual_insert = funcs.visual_insert
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

    visual_insert("rm", "\\mathrm{<>}", "Math Roman", in_mathzone),
    visual_insert("it", "\\mathit{<>}", "Math Italic", in_mathzone),
    visual_insert("bf", "\\mathbf{<>}", "Math Bold", in_mathzone),
    visual_insert("mc", "\\mathcal{<>}", "MathCal", in_mathzone),
    visual_insert("bb", "\\mathbb{<>}", "MathBB", in_mathzone),
    
    object("top", "\\mathcal{T}", "Topology", in_mathzone),

    object("dss", "\\displaystyle", "displaystyle", in_mathzone),

    inner_snip("text", "\\text{<>}", "text module", in_mathzone),

    object(",,", ",\\,", "comma space", in_mathzone),
    object("quad", "\\quad", "quad", in_mathzone),
    object("qquad", "\\qquad", "qquad", in_mathzone, 5),
    object("vsm", "\\vspace{-5pt}", "qquad"),


    -- Math Fonts
    inner_snip("rm", "\\mathrm{<>}", "Math Roman", in_mathzone),
    inner_snip("it", "\\mathit{<>}", "Math Italic", in_mathzone),
    inner_snip("bf", "\\mathbf{<>}", "Math Bold", in_mathzone),
    inner_snip("mc", "\\mathcal{<>}", "MathCal", in_mathzone),
    inner_snip("bb", "\\mathbb{<>}", "MathBB", in_mathzone),

    var_postfixer("bb", "\\mathbb", "Postfix Variable to mathbb", in_mathzone, 10),
    var_postfixer("rm", "\\mathrm", "Postfix Variable to mathrm", in_mathzone, 10),
    var_postfixer("mc", "\\mathcal", "Postfix Variable to mathcal", in_mathzone, 10),

}

-- Combine automated lists with manual list
for _, snippet in ipairs(manual_snippet_list) do
    table.insert(autosnippets, snippet)
end

-- Regular snippets
local snippets = {
}

return snippets, autosnippets
