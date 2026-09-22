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
    {"!=", "\\ne", 0},
    {">=", "\\ge", 0},
    {"<=", "\\le", 0},
    {"===", "\\equiv", 0},
    {">>", "\\gg", 0},
    {"<<", "\\ll", 0},
    {"~~", "\\sim", 0},
    {"\\sim~", "\\approx", 0},
    {"~=", "\\simeq", 0},
    {"prop", "\\propto", 0},
    {"ideal", "\\unlhd", 0},

    -- Arrows
    {"<->", "\\leftrightarrow ", 0},
    {"->", "\\to", 0},
    {"!>", "\\mapsto", 0},
    {"=>", "\\implies", 0},
    {"=<", "\\impliedby", 0},
    {"|=", "\\models", 0},
    {"iff", "\\iff", 0},

    -- Set Theory
    {"Exts", "\\exists", 0},
    {"nExts", "\\nexists", 0},
    {"fAll", "\\forall", 0},
    {"sst", "\\subset", 0},
    {"spt", "\\supset", 0},
    {"inn", "\\in", 0},
    {"\\subsetq", "\\subseteq", 0},
    {"\\subseteqq", "\\sqsubseteq", 0},
    {"ntri", "\\lhd", 0},
    {"fAe", "\\forall\\epsilon", 0},
    {"tEd", "\\exists\\delta", 0},
    {"fAx", "\\forall x", 0},

    -- Topology
    {"Ull", "U_{\\lambda, 0}"},
    {"linla", "\\lambda\\in\\Lambda", 0},
    {"xinx", "x\\in X", 0},
    {"ninn", "n\\in\\mathbb{N, 0}"},

    -- Separators
    {"para", "\\parallel", 0},
    {"|\\", "\\setminus", 0},
    {"||", "\\mid", 0},

    -- uhh logic and cap cup things
    {"cap", "\\cap", 0},
    {"\\capq", "\\sqcap", 0},
    {"cup", "\\cup", 0},
    {"\\cupq", "\\sqcup", 0},
    {"VV", "\\vee", 0},
    {"NN", "\\wedge", 0},

    -- Random symbols
    {"prod", "\\prod", 0},
    {"log", "\\log", 0},
    {"mp", "\\mp", 0},
    {"Sq", "\\square", 0},
    {"nabl", "\\nabla", 0},
    {"del", "\\nabla", 0},
    {"xx", "\\times", 0},
    {"**", "\\cdot", 0},
    {"ell", "\\ell", 0},
    {"e\\mpt", "\\emptyset", 0},
    {"\\\\\\", "\\backslash", 0},
    {"to\\pint", "A^{\\circ, 0}"},
    {"infty", "\\infty", 0},

    -- Postfixes
    {"\\mathrm{e, 0}i", "ermi", 0},
    {"\\ref{e, 0}", "refe", 0},



    -- Random operators
    {"pi", "\\pi", 0},
    {"det", "\\det", 0},
    {"sgn", "\\sgn", 0},
    {"Mat", "\\Mat", 0},
    {"cos", "\\cos", 0},
    {"sin", "\\sin", 0},
    {"tan", "\\tan", 0},


    -- Topology
    {"topo", "\\mathcal{T}", 0},
    {"xtopo", "(X, \\mathcal{T})", 5},
    {"ytopo", "(Y, \\mathcal{U})", 5},
    {"xmet", "(X, d)", 0},

    -- x and y abbreviations
    {"xnn", "x_{n}", 0},
    {"ynn", "y_{n}", 0},
    {"fxx", "f(x)", 10},
    {"gxx", "g(x)", 10},
    {"fnn", "f_{n}", 10},
    {"fnx", "f_{n}(x)", 10},
    {"cfn", "(f_{n})", 10},
    {"zxf", "f(x_{0})", 10}, -- not consistent but rolls off the hand easier
    {"fyy", "f(y)", 10},

    -- open balls
    {"BX", "B_{X}", 10},
    {"BY", "B_{Y}", 10},

    -- Vectors
    {"vvc", "\\vec{v}", 10},
    {"0vc", "\\vec{0}", 10},
}

local manual_snips = {
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
	autosnips, object(snip[1], snip[2], "", in_mathzone, snip[3])
    )
end

for _, snip in ipairs(manual_snips) do
    table.insert(
	autosnips, snip
    )
end

return {}, autosnips
