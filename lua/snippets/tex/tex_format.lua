local ls = require 'luasnip'
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local fmta = require('luasnip.extras.fmt').fmta


local conditions = require('snippet-helpers.luasnip-conditions')
local funcs = require('snippet-helpers.luasnip-constructors')

local line_begin = conditions.line_begin
local in_list = conditions.in_list
local in_text = conditions.in_text
local in_env = conditions.in_env
local in_align = conditions.in_align
local in_mat = conditions.in_mat


local inner_snip = funcs.inner_snip
local object = funcs.object
local env_snip = funcs.env_snip
local thmbox = funcs.thmbox



return {
    -- Theorem Boxes
    thmbox("add;thm", "thm", "Add a Theorem" ),
    thmbox("add;def", "dfn", "Add a Definition" ),
    thmbox("add;xmp", "xmp", "Add an Example" ),
    thmbox("add;rem", "rem", "Add a Remark" ),
    thmbox("add;rcl", "rcl", "Add a Remark" ),

    -- Single line named expressions
    inner_snip("add;sc", "\\section{<>}", "add a section", line_begin),
    inner_snip("add;nsc", "\\section*{<>}", "add an unnumbered section", line_begin),
    inner_snip("add;ss", "\\subsection{<>}", "add a subsection", line_begin),
    inner_snip("add;nss", "\\subsection*{<>}", "add an unnumbered subsection", line_begin),
    inner_snip("add;s3", "\\subsubsection{<>}", "add a subsection", line_begin),
    inner_snip("add;ns3", "\\subsubsection*{<>}", "add an unnumbered subsection", line_begin),
    inner_snip("add;pac", "\\usepackage{<>}", "add a package", line_begin),

    -- Multi line named environments
    env_snip("add;align", "align*", "add an align environment"),
    env_snip("add;nalign", "align", "add a numbered align environment"),

    -- No variable expressions
    -- object("add;bar", "\\noindent\\rule{\\textwidth}{0.2pt}", "Add a horizontal bar"),
    object("add;bar", "\\longrule{0.08ex}", "Add a horizontal bar"),
    inner_snip("add;tbar", "\\textrule{<>}", "Add a horizontal bar with text label"),


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
	{trig="add;item", dscr="add an itemized list"},
	fmta(
	-- \renewcommand\labelitemi{\tiny$\bullet$}
	    [[
	\begin{itemize}
	    \item <>
	\end{itemize}
	]],
	    {
		i(1),
	    }
	)
    ),
    s(
	{trig="add;itemns", dscr="add an itemized list with no spacing"},
	fmta(
	-- \renewcommand\labelitemi{\tiny$\bullet$}
	    [[
	\begin{itemize}
	    \setlength\itemsep{0em}
	    \item <>
	\end{itemize}
	]],
	    {
		i(1),
	    }
	)
    ),
    s(
	{trig="add;itemnsl", dscr="add an itemized list"},
	fmta(
	-- \renewcommand\labelitemi{\tiny$\bullet$}
	    [[
	\begin{itemize}[leftmargin=*]
	    \setlength\itemsep{0em}
	    \item <>
	\end{itemize}
	]],
	    {
		i(1),
	    }
	)
    ),
    s(
	{trig="add;enum", dscr="Add an enumerated list"},
	fmta(
	-- \renewcommand\labelitemi{\tiny$\bullet$}
	    [[
	\begin{enumerate}
	    \item <>
	\end{enumerate}
	]],
	    {
		i(1),
	    }
	)
    ),
    s(
	{trig="add;enumns", dscr="Add an enumerated list with no spacing"},
	fmta(
	-- \renewcommand\labelitemi{\tiny$\bullet$}
	    [[
	\begin{enumerate}
	    \setlength\itemsep{0em}
	    \item <>
	\end{enumerate}
	]],
	    {
		i(1),
	    }
	)
    ),
    s(
	{trig="add;enumnsl", dscr="Add an enumerated list with no spacing"},
	fmta(
	-- \renewcommand\labelitemi{\tiny$\bullet$}
	    [[
	\begin{enumerate}[leftmargin=*]
	    \setlength\itemsep{0em}
	    \item <>
	\end{enumerate}
	]],
	    {
		i(1),
	    }
	)
    ),

},

{
    -- -- Fonts
    inner_snip("tbb", "\\textbf{<>}", "Text Bold", in_text),
    inner_snip("tii", "\\textit{<>}", "Text Italic", in_text),

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
    inner_snip("\\item ;", "\\item[\\textbf{<>}:]", "Text Italic", in_text),

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
    )
}
