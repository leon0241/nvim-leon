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

local inner_snip = funcs.inner_snip
local in_list = conditions.in_list
local in_env = conditions.in_env
local in_align = conditions.in_align
local in_mat = conditions.in_mat

local env_snip = funcs.env_snip


-- 

--- Determines what to suffix for a newline call in environments
--- @param args any
--- @param parent any
--- @param user_args any
--- @return string
local function env_autoend(args, parent, user_args)
    local envname = vim.fn['vimtex#env#get_inner']()["name"]

    local newlines = { "align", "align*" , "cases"}

    if h.is_in(newlines, envname) or envname:sub(-6) == "matrix" then
    	return "\\\\"
    else
	return ""
    end
end

---Determines what kind of command to prefix at the start of a new line in an environment using j;
---@param args any
---@param parent any
---@param user_args any
---@return string
local function env_autostart(args, parent, user_args)
    local envname = vim.fn['vimtex#env#get_inner']()["name"]

    local nl_math_envs = { "itemize", "enumera"}
    print(vim.inspect(envname))

    if h.is_in(nl_math_envs, envname:sub(1,7)) then
    	return "\\item "
    else
	return ""
    end
end


return {
    -- Multi line named environments
    env_snip("add;align", "align*", "add an align environment", line_begin),
    env_snip("add;nalign", "align", "add a numbered align environment", line_begin),
    env_snip("add;proof", "proof", "add a proof environment", line_begin),
    env_snip("add;eq", "equation", "add an equation environment", line_begin),

    s(
	{trig = "add;prooftree", dscr = "Add a proof tree"},
	fmta(
	    [[
	\prftree{<>}{<>}
	]],
	    {
		i(1),
		i(2),
	    }
	)
    ),

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

    -- Individual snippets
    s(
	{trig="add;img", dscr="Add an Image"},
	fmta(
	    [[
	\begin{figure}[H]
	    \centering
	    \includegraphics[width=\linewidth]{<>}
	    \caption{<>}
	\end{figure}
	]],
	    { i(1), i(2)}
	)
    ),
    s(
	{trig="add;fig", dscr="Add a Figure"},
	fmta(
	    [[
	\begin{figure}[h!]
	    \centering
	    <>
	    \caption{<>}
	    \label{<>}
	\end{figure}
	]],
	    {
		i(1, "figure"),
		i(2, "Caption"),
		i(3, "Label"),
	    }
	)
    ),
    s(
	{trig="add;item", dscr="add an itemized list"},
	fmta(
	    [[
	\begin{itemize}
	    \item <>
	\end{itemize}
	]],
	    {i(1)}
	)
    ),
    s(
	{trig="add;itemt", dscr="add an itemized list with no spacing"},
	fmta(
	-- \renewcommand\labelitemi{\tiny$\bullet$}
	    [[
	\begin{itemize-tight}
	    \item <>
	\end{itemize-tight}
	]],
	    {i(1)}
	)
    ),
    s(
	{trig="add;itemz", dscr="add an itemized list"},
	fmta(
	    [[
	\begin{itemize-zero}
	    \item <>
	\end{itemize-zero}
	]],
	    {i(1)}
	)
    ),
    s(
	{trig="add;enum", dscr="Add an enumerated list"},
	fmta(
	    [[
	\begin{enumerate}
	    \item <>
	\end{enumerate}
	]],
	    {i(1)}
	)
    ),
    s(
	{trig="add;enumt", dscr="Add an enumerated list with no spacing"},
	fmta(
	    [[
	\begin{enumerate-tight}
	    \item <>
	\end{enumerate-tight}
	]],
	    {i(1)}
	)
    ),
    s(
	{trig="add;enumz", dscr="Add an enumerated list left aligned"},
	fmta(
	    [[
	\begin{enumerate-zero}
	    \item <>
	\end{enumerate-zero}
	]],
	    {i(1)}
	)
    ),
    s(
	{trig="add;enumaz", dscr="Add an enumerated list left aligned"},
	fmta(
	    [[
	\begin{enumerate-a-zero}
	    \item <>
	\end{enumerate-a-zero}
	]],
	    {i(1)}
	)
    ),
    s(
	{trig="add;enumat", dscr="Add an enumerated list left aligned"},
	fmta(
	    [[
	\begin{enumerate-a-tight}
	    \item <>
	\end{enumerate-a-tight}
	]],
	    {i(1)}
	)
    ),


}, {
    s(
	{trig = "jO", wordTrig=false},
	fmta(
	    [[
	<>
	<><>
	]],
	    {
		f(env_autoend, {}, {}),
		f(env_autostart, {}, {}),
		i(0)
	    }
	)
    ),
    -- a;l to create a new line on itemized lists?
    s(
	{trig="jm", wordTrig=false},
	fmta(
	    [[


	\item $<>$
	]], {i(1)}
	),
	{ condition = in_list }
    ),
    inner_snip("\\item ;", "\\item[\\textbf{<>})]", "Custom Item", in_text),

    s(
	{trig="j[", wordTrig=false},
	fmta("&", {}
	),
	{ condition = in_align }
    ),
    s(
	{trig="j[", wordTrig=false},
	fmta("& ", {}
	),
	{ condition = in_mat }
    ),


    env_snip("cases", "cases", "add a case environment", line_begin and in_mathzone),

    env_snip("mat", "matrix", "add a matrix", line_begin and in_mathzone),
    env_snip("pmat", "pmatrix", "add a bracket matrix", line_begin and in_mathzone),
    env_snip("bmat", "bmatrix", "add a square bracket matrix", line_begin and in_mathzone),
    env_snip("Bmat", "Bmatrix", "add a curly bracket matrix", line_begin and in_mathzone),
    env_snip("vmat", "vmatrix", "add a pipe matrix", line_begin and in_mathzone),
    env_snip("Vmat", "vmatrix", "add a double pipe matrix", line_begin and in_mathzone),
}
