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

local snippet_list = {
 --    s(
	-- {trig="metric-def", dscr="Definition of metric space"},
	-- t("metric space $(X, d)$")
 --    ),
 --    s(
	-- {trig="metric-def-let", dscr="Let (X,d) be a metric space"},
	-- t("Let $(X, d)$ be a metric space")
 --    ),
 --    s(
	-- {trig="metric-dd-let", dscr="Let metric double def"},
	-- t("Let $(X, d_{X}),\\,(Y, d_{Y})$ be metric spaces")
 --    ),
 --    s(
	-- {trig="let-metric-dd-p-f", dscr="Let metric double def, point, function"},
	-- t("Let $(X, d_{X}),\\,(Y, d_{Y})$ be metric spaces, $x_{0}$ be a point in $X$, and $f : X \\to Y$ be a function.")
 --    ),
 --    s(
	-- {trig="epsilon-delta", dscr="Epsilon-Delta Snippet"},
	-- t("for every positive $\\epsilon$, there exists an index $N$, such that for all indices $n$ with $n\\ge N$, ")
 --    ),
 --    s(
	-- {trig="ref-lecture", dscr="Lecture reference note"},
	-- fmta("Watch lecture recording <> for examples of ", { i(1, "date") })
 --    ),
}

return snippet_list, {
    s(
	{trig="f;co", dscr="cont -> continuous"},
	t("continuous")
    ),
}
