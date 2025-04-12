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


return {
    inner_snip("add;trantag", "\\label{trans:<>}\\tag{T\\thetranslations}\\stepcounter{translations}"),
    inner_snip("add;functag", "\\label{func:<>}\\tag{F\\thefuncs}\\stepcounter{funcs}"),
    inner_snip("add;commtag", "\\label{comm:<>}\\tag{C\\thecomms}\\stepcounter{comms}"),
    inner_snip("add;sostag", "\\label{sos:<>}\\tag{S\\thesos}\\stepcounter{sos}"),

    s(
	{trig = "add;traneq", dscr = "Add an Translation Environment"},
	fmta(
	    [[
	\begin{equation}\label{trans:<>}
	\tag{T\thetranslations}\stepcounter{translations}
	    <>
	\end{equation}
	]],
	    {
		i(1, "name"),
		i(2),
	    }
	)
    ),
    s(
	{trig = "add;funceq", dscr = "Add a Function Equation"},
	fmta(
	    [[
	\begin{equation}\label{func:<>}
	\tag{F\thefuncs}\stepcounter{funcs}
	    <>
	\end{equation}
	]],
	    {
		i(1, "name"),
		i(2),
	    }
	)
    ),
    s(
	{trig = "add;commeq", dscr = "Add a Communication Equation"},
	fmta(
	    [[
	\begin{equation}\label{comm:<>}
	\tag{C\thecomms}\stepcounter{comms}
	    <>
	\end{equation}
	]],
	    {
		i(1, "name"),
		i(2),
	    }
	)
    ),
    s(
	{trig = "add;soseq", dscr = "Add a GSOS Rule"},
	fmta(
	    [[
	\begin{equation}\label{comm:<>}
	\begin{aligned}
	\tag{S\thecomms}\stepcounter{comms}
	    <>
	\end{aligned}
	\end{equation}
	]],
	    {
		i(1, "name"),
		i(2),
	    }
	)
    ),
}, {}
