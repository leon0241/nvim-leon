local conditions = require('snippet-helpers.luasnip-conditions')
local funcs = require('snippet-helpers.luasnip-constructors')

local in_mathzone = conditions.in_mathzone
local inner_snip = funcs.inner_snip

local snippet_list = {}

local manual_snippet_list = {
    inner_snip("floor", "\\lfloor <> \\rfloor", "Floor function", in_mathzone ),
    inner_snip("ceil", "\\lceil <> \\rceil", "Ceiling function", in_mathzone ),

    inner_snip("avg", "\\langle <> \\rangle", "Angled Braces", in_mathzone ),
    inner_snip("abs", "\\lvert <> \\rvert", "Absolute Value", in_mathzone ),
    inner_snip("norm", "\\lVert <> \\rVert", "Norm", in_mathzone),
}

-- Combine automated lists with manual list
for _, snippet in ipairs(manual_snippet_list) do
    table.insert(snippet_list, snippet)
end

return {}, snippet_list
