local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local helper = require('luasnip-helper-funcs')
local fmta = require('luasnip.extras.fmt').fmta

local line_begin = require("luasnip.extras.expand_conditions").line_begin
local in_math = helper.in_mathzone
local inner_snip = helper.inner_snip

local snippet_list = {}

local mathbb_letters = {"R", "N", "Q", "Z", "C", "E", "P", "1"}

-- Turns |R into \mathbb{R} for some R
local function mathbb_snippet(letter)
    return s(
	"|" .. letter,
	t("\\mathbb{" .. letter .. "}"),
	{ condition = in_math }
    )
end

-- Adds a superscripted or subscripted symbol to a mathBB 
local function mbb_super_sub(letter, super, sign)
    return s(
	"\\mathbb{" .. letter .. "}" .. super,
	t("\\mathbb{" .. letter .. "}" .. sign .. "{" .. super .. "}"),
	{ condition = in_math }
    )
end


-- Inserts all regular mathBBs into a table
for _, letter in ipairs(mathbb_letters) do
    table.insert(snippet_list, mathbb_snippet(letter))
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

    -- inner_snip("rm", "\\mathrm{<>}", "Math Roman", in_mathzone),
    -- inner_snip("it", "\\mathit{<>}", "Math Italic", in_mathzone),
    -- inner_snip("bf", "\\mathbf{<>}", "Math Bold", in_mathzone),
    -- inner_snip("mc", "\\mathcal{<>}", "MathCal", in_mathzone),
    -- inner_snip("bb", "\\mathbb{<>}", "MathBB", in_mathzone),

    -- inner_snip("f;bf", "\\textbf{<>}", "Text Bold", true),
    -- inner_snip("f;it", "\\textit{<>}", "Text Italic", true),
}


-- Combine automated lists with manual list
for _, snippet in ipairs(manual_snippet_list) do
    table.insert(snippet_list, snippet)
end

return {}, snippet_list
