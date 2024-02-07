local ls = require 'luasnip'
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local rep = require("luasnip.extras").rep
local fmta = require('luasnip.extras.fmt').fmta

local conditions = require('snippet-helpers.luasnip-conditions')
local funcs = require('snippet-helpers.luasnip-constructors')

local line_begin = conditions.line_begin
local in_itemize = conditions.in_itemize
local in_mathzone = conditions.in_mathzone

local in_text = conditions.in_mathzone
local in_env = conditions.in_env

local env_snip = funcs.env_snip
local object = funcs.object



return {},{
    -- Limits
    s(
	{trig = "lim", priority = -100, wordTrig = false},
	t("\\lim_{0\\to\\infty}"),
	{condition = in_mathzone}
    ),
    s(
	{trig = "clim", dscr = "customisable lim", wordTrig = false},
	fmta(
	    "\\lim_{<>\\to <>}",
	    {i(1, "0"), i(2, "\\infty")}
	),
	{condition = in_mathzone}
    ),
    s(
	{trig = "slim", dscr = "limsup", wordTrig = false},
	fmta(
	    "\\limsup_{<>\\to <>}",
	    {i(1, "0"), i(2, "\\infty")}
	),
	{condition = in_mathzone}
    ),
    s(
	{trig = "ilim", dscr = "liminf", wordTrig = false},
	fmta(
	    "\\liminf_{<>\\to <>}",
	    {i(1, "0"), i(2, "\\infty")}
	),
	{condition = in_mathzone}
    ),

    -- Integrals
    s(
	{trig = "int", priority = -100, wordTrig = false},
	t("\\int"),
	{condition = in_mathzone}
    ),

    object("\\intzi", "\\int_{0}^{\\infty} ", "integral from 0 to infinity", in_mathzone),
    object("\\intii", "\\int_{-\\infty}^{\\infty} ", "integral from 0 to infinity", in_mathzone),

    s(
	{trig = "cint", dscr = "customisable integral", wordTrig = false},
	fmta(
	    "\\int_{<>}^{<>} <> d<>",
	    {i(1, "a"), i(2, "b"), i(4), i(3, "x")}
	),
	{ condition = in_mathzone }
    ),
    s(
	{trig = "dint", dscr = "dx integral", wordTrig = false},
	fmta(
	    "\\int<> d<>",
	    {i(2), i(1, "x")}
	),
	{ condition = in_mathzone }
    ),
    s(
	{trig = "aint", dscr = "area integral", wordTrig = false},
	fmta(
	    "\\int_{<>} <> d<>",
	    {i(1), i(3), i(2, "x")}
	),
	{ condition = in_mathzone }
    ),

    -- Sums
    s(
	{trig = "sum", priority = -100, wordTrig = false},
	t("\\sum"),
	{ condition = in_mathzone }
    ),
    object("\\sumzi", "\\sum_{n=0}^{\\infty} ", "sum from 0 to infinity", in_mathzone),
    object("\\sumoi", "\\sum_{n=1}^{\\infty} ", "sum from 1 to infinity", in_mathzone),
    s(
	{trig = "csum", dscr = "customisable sum", wordTrig = false},
	fmta(
	    "\\sum_{<> = <>}^{<>}",
	    {i(1, "n"), i(2, "0"), i(3, "\\infty")}
	),
	{ condition = in_mathzone }
    ),

    -- Sequences
    object("nseq", "(x_{n})", "x_n sum", in_mathzone),
    object("fseq", "(f_{n})_{n\\in\\mathbb{N}}", "(f_n)_{n∈N} sum", in_mathzone),
    s(
	{trig = "cseq", dscr = "customisable sequence", wordTrig = false},
	fmta(
	    "\\(<>_{n})",
	    {i(1, "x")}
	),
	{ condition = in_mathzone }
    ),

    s(
	{trig = "CAP", dscr = "big cap"},
	fmta(
	    "\\bigcap\\limits_{<> \\in\\mathbb{N}}^{<>}",
	    {i(1, "n"), i(2, "\\infty")}
	),
	{ condition = in_mathzone}
    ),
    s(
	{trig = "CUP", dscr = "big cup"},
	fmta(
	    "\\bigcup\\limits_{<> \\in\\mathbb{N}}^{<>}",
	    {i(1, "n"), i(2, "\\infty")}
	),
	{ condition = in_mathzone}
    ),
}
