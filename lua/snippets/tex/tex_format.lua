local ls = require 'luasnip'
local s = ls.snippet
local i = ls.insert_node
local fmta = require('luasnip.extras.fmt').fmta

local line_begin = require("luasnip.extras.expand_conditions").line_begin

local conditions = require('snippet-helpers.luasnip-conditions')
local funcs = require('snippet-helpers.luasnip-constructors')
local in_itemize = conditions.in_itemize

local inner_snip = funcs.inner_snip
local object = funcs.object
local env_snip = funcs.env_snip
local thmbox = funcs.thmbox



return {
    -- Theorem Boxes
    thmbox("add;thm", "thm", "Add a Theorem" ),
    thmbox("add;def", "def", "Add a Definition" ),
    thmbox("add;xmp", "xmp", "Add an Example" ),
    thmbox("add;rem", "rem", "Add a Remark" ),

    -- Single line named expressions
    inner_snip("add;sc", "\\section*{<>}", "add a section", line_begin),
    inner_snip("add;nsc", "\\section{<>}", "add a numbered section", line_begin),
    inner_snip("add;ss", "\\subsection*{<>}", "add a subsection", line_begin),
    inner_snip("add;nss", "\\subsection{<>}", "add a numbered subsection", line_begin),
    inner_snip("add;pac", "\\usepackage{<>}", "add a package", line_begin),

    -- Multi line named environments
    env_snip("add;align", "align*", "add an align environment"),
    env_snip("add;nalign", "align", "add a numbered align environment"),

    -- No variable expressions
    object("add;bar", "\\noindent\\rule{\\textwidth}{0.2pt}", "Add a horizontal bar"),

    -- Individual snippets
    s(
	{trig="add;img", dscr="Add an Image"},
	fmta(
	    [[
	\begin{figure}[H]
	    \centering
	    \includegraphics[width=\linewidth]{<>}
	\end{figure}
	]],
	    { i(1, "url")}
	)
    ),
    s(
	{trig="add;fig", dscr="Add a Figure"},
	fmta(
	    [[
	\begin{figure}[h!]
	    \centering
	    \includegraphics[width=\linewidth]{<>}
	    \caption{<>}
	    \label{<>}
	\end{figure}
	]],
	    {
		i(1, "url"),
		i(2, "Caption"),
		i(3, "Label"),
	    }
	)
    ),
    s(
	{trig="add;item", dscr="Add an itemized list"},
	fmta(
	    [[
	\renewcommand\labelitemi{\tiny$\bullet$}
	\begin{itemize}
	    \item <>
	\end{itemize}
	]],
	    {
		i(1),
	    }
	)
    ),

}, {
    s(
	{trig="a;l"},
	fmta(
	    [[
	\\
	\item 
	]], {}
	),
	{ condition = in_itemize }
    )
}
