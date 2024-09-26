local ls = require 'luasnip'
local s = ls.snippet
local i = ls.insert_node
local rep = require("luasnip.extras").rep
local fmta = require('luasnip.extras.fmt').fmta
local f = ls.function_node
local k = require("luasnip.nodes.key_indexer").new_key

local conditions = require('snippet-helpers.luasnip-conditions')
local funcs = require('snippet-helpers.luasnip-constructors')
local h = require('snippet-helpers.helpers')

local line_begin = conditions.line_begin
local in_mathzone = conditions.in_mathzone

local env_snip = funcs.env_snip

local function env_autoend(args, parent, user_args)
    local envname = vim.fn['vimtex#env#get_inner']()["name"]

    local newlines = { "align", "align*" }

    if h.is_in(newlines, envname) or envname:sub(-6) == "matrix" then
    	return "\\\\"
    else
	return ""
    end
end

local function env_autostart(args, parent, user_args)
    local envname = vim.fn['vimtex#env#get_inner']()["name"]

    local nl_math_envs = { "itemize", "enumerate"}

    if h.is_in(nl_math_envs, envname) then
    	return "\\item "
    else
	return ""
    end
end


-- local function table_auto(args, parent, user_args)
--     
--     return '[' .. args[1][1] .. user_args .. ']'
-- end

-- s("trig", {
--   i(1), t '<-i(1) ',
--   f(fn,  -- callback (args, parent, user_args) -> string
--     {2}, -- node indice(s) whose text is passed to fn, i.e. i(2)
--     { user_args = { "user_args_value" }} -- opts
--   ),
--   t ' i(2)->', i(2), t '<-i(2) i(0)->', i(0)
-- })
--
--     s(
-- 	{trig = "add;table", dscr = "Add a table"},
-- 	fmta(
-- 	    [[
-- 	\begin{tabular}{ |<>| }
-- 	    <>
-- 	\end{tabular}
-- 	]],
-- 	    {
-- 		i(1, "", {key="table_cols"}),
-- 		f(table_auto, {k("table_cols")}
--
-- 	    )
-- 	    }
-- 	)
--     ),
--


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
    ),
    s(
	{trig = "add;multi", dscr = "Add a Multicol"},
	fmta(
	    [[
	\begin{multicols}{<>}
	<>
	\end{multicols}
	]],
	    {
		i(1, "2"),
		i(0)
	    }
	)
    ),
    s(
	{trig = "add;multibar", dscr = "Add a Multicol with vertical bar"},
	fmta(
	    [[
	\setlength{\columnseprule}{0.5pt}
	\begin{multicols}{<>}
	    <>
	\end{multicols}
	]],
	    {
		i(1, "2"),
		i(0)
	    }
	)
    ),

    s(
	{trig = "add;table", dscr = "Add a table"},
	fmta(
	    [[
	\begin{tabular}{ |<>| }
	    <>
	\end{tabular}
	]],
	    {
		i(1, "name"),
		i(2),
	    }
	)
    ),


}, {
    s(
	{trig = "j;", wordTrig=false},
	fmta(
	    [[
	<>
	<><>
	]],
	    {
		f(env_autoend, {}, {user_args = {"test"}}),
		f(env_autostart, {}, {user_args = {"test"}}),
		i(0)
	    }
	)
    ),


    env_snip("cases", "cases", "add a case environment", line_begin and in_mathzone),

    env_snip("mat", "matrix", "add a matrix", line_begin and in_mathzone),
    env_snip("pmat", "pmatrix", "add a bracket matrix", line_begin and in_mathzone),
    env_snip("bmat", "bmatrix", "add a square bracket matrix", line_begin and in_mathzone),
    env_snip("Bmat", "Bmatrix", "add a curly bracket matrix", line_begin and in_mathzone),
    env_snip("vmat", "vmatrix", "add a pipe matrix", line_begin and in_mathzone),
    env_snip("Vmat", "vmatrix", "add a double pipe matrix", line_begin and in_mathzone),

}
