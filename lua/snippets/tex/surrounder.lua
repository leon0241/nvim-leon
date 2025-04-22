local conditions = require('snippet-helpers.luasnip-conditions')
local funcs = require('snippet-helpers.luasnip-constructors')
local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local f = ls.function_node
local i = ls.insert_node
local fmta = require('luasnip.extras.fmt').fmta

local in_mathzone = conditions.in_mathzone
local inner_snip = funcs.inner_snip

local snippet_list = {}

local manual_snippet_list = {
    inner_snip("floor", "\\lfloor <> \\rfloor", "Floor function", in_mathzone ),
    inner_snip("ceil", "\\lceil <> \\rceil", "Ceiling function", in_mathzone ),

    inner_snip("avg", "\\langle <> \\rangle", "Angled Braces", in_mathzone ),
    inner_snip("abs", "\\lvert <> \\rvert", "Absolute Value", in_mathzone ),
    inner_snip("norm", "\\lVert <> \\rVert", "Norm", in_mathzone, 10),
    inner_snip("(", "(<>)", "Brackets"),
    inner_snip("[", "[<>]", "Square Brackets"),
    inner_snip("{", "{<>}", "Curly Brackets"),
    inner_snip("rbsb", "(<>]", "Round Bracket Square Bracket"),
    inner_snip("sbrb", "[<>)", "Round Bracket Square Bracket"),
    inner_snip("``", "``<>''", "LaTeX Proper Quotations"),
 --    s(
	-- {trig="(%(.*)%)", regTrig=true, wordTrig=false, priority=-1, dscr="don't repeat close bracket"},
	-- -- fmta(
	-- --     "<>)",
	-- --     {
	-- -- 	f( function(_, snip) return snip.captures[1] end),
	-- --     }
	-- -- ),
	-- t("test"),
	-- { condition = in_mathzone}
 --    ),
}

-- Combine automated lists with manual list
for _, snippet in ipairs(manual_snippet_list) do
    table.insert(snippet_list, snippet)
end

return {}, snippet_list
