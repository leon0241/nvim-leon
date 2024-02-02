-- Luasnip functions
local ls = require 'luasnip'
-- local s = ls.snippet
-- local t = ls.text_node
-- local i = ls.insert_node
-- local fmta = require('luasnip.extras.fmt').fmta

-- Import helper functions
local conditions = require('snippet-helpers.luasnip-conditions')
local funcs = require('snippet-helpers.luasnip-constructors')

-- Line conditions
local line_begin = conditions.line_begin
local in_mathzone = conditions.in_mathzone
local in_text = conditions.in_text

-- Constructor functions
local inner_snip = funcs.inner_snip

local mbb_super_sub = funcs.mbb_super_sub
local mathbb_snippet = funcs.mathbb_snippet

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

    inner_snip("rm", "\\mathrm{<>}", "Math Roman", in_mathzone),
    inner_snip("it", "\\mathit{<>}", "Math Italic", in_mathzone),
    inner_snip("bf", "\\mathbf{<>}", "Math Bold", in_mathzone),
    inner_snip("mc", "\\mathcal{<>}", "MathCal", in_mathzone),
    inner_snip("bb", "\\mathbb{<>}", "MathBB", in_mathzone),

}

-- Combine automated lists with manual list
for _, snippet in ipairs(manual_snippet_list) do
    table.insert(autosnippets, snippet)
end

-- Regular snippets
local snippets = {
    -- inner_snip("f;bf", "\\textbf{<>}", "Text Bold", in_text),
    -- inner_snip("f;it", "\\textit{<>}", "Text Italic", in_text),
}

return snippets, autosnippets