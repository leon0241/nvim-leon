local ls = require 'luasnip'
local s = ls.snippet
local i = ls.insert_node
local rep = require("luasnip.extras").rep
local fmta = require('luasnip.extras.fmt').fmta

local conditions = require('snippet-helpers.luasnip-conditions')
local funcs = require('snippet-helpers.luasnip-constructors')

local line_begin = conditions.line_begin
local in_mathzone = conditions.in_mathzone

local in_text = conditions.in_mathzone
local in_env = conditions.in_env

local env_snip = funcs.env_snip



return {
    -- Multi line named environments
    env_snip("add;align", "align*", "add an align environment", line_begin),
    env_snip("add;nalign", "align", "add a numbered align environment", line_begin),
    env_snip("add;proof", "proof", "add a proof environment", line_begin),

    s(
	{trig = "add;env", dscr = "Add an environment"},
	fmta(
	    [[
	\begin{<>}
	<>
	\end{<>}
	]],
	    {
		i(1, "name"),
		i(2),
		rep(1)
	    }
	)
    )
}, {
    env_snip("cases", "cases", "add a case environment", line_begin and in_mathzone),

    env_snip("mat", "matrix", "add a matrix", line_begin and in_mathzone),
    env_snip("pmat", "pmatrix", "add a bracket matrix", line_begin and in_mathzone),
    env_snip("bmat", "bmatrix", "add a square bracket matrix", line_begin and in_mathzone),
    env_snip("Bmat", "Bmatrix", "add a curly bracket matrix", line_begin and in_mathzone),
    env_snip("vmat", "vmatrix", "add a pipe matrix", line_begin and in_mathzone),
    env_snip("Vmat", "vmatrix", "add a double pipe matrix", line_begin and in_mathzone),

}
