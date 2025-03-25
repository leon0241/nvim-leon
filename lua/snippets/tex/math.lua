local ls = require 'luasnip'
local s = ls.snippet
local i = ls.insert_node
local fmta = require('luasnip.extras.fmt').fmta


local conditions = require('snippet-helpers.luasnip-conditions')

local line_begin = conditions.line_begin
local in_mathzone = conditions.in_mathzone



-- generate nil-opts-instances here, and save them.
-- This is to prevent generating 100s of the exact same function.

local default_expansion_capture

local function apply_common_opts(line_to_cursor, opts)
	if opts and opts.max_len then
		return line_to_cursor:sub(#line_to_cursor - opts.max_len + 1)
	else
		return line_to_cursor
	end
end



--trigEngine(trigger, opts) -> (matcher(line_to_cursor, trigger) -> whole_match, captures)
local function expansion_capture(trigger, opts)
	if opts == nil then
		return default_expansion_capture
	end

	return function(line_to_cursor, trigger)
		line_to_cursor = apply_common_opts(line_to_cursor, opts)


	end
end

local function match_plain(_, opts)
	if opts == nil then
		return default_match_plain
	end

	return function(line_to_cursor, trigger)
		line_to_cursor = apply_common_opts(line_to_cursor, opts)
		if
			line_to_cursor:sub(#line_to_cursor - #trigger + 1, #line_to_cursor)
			== trigger
		then
			-- no captures for plain trigger.
			return trigger, {}
		else
			return nil
		end
	end
end
default_expansion_capture = expansion_capture(nil, {})


return {}, {
	s(
		{trig="mk", dscr="Expand Inline Math"},
		fmta("$<>$", { i(1) })
	),
	s(
		{trig="dm", dscr="Expand Math"},
		fmta("\\[<>\\]", { i(1) }),
		{condition = line_begin}
	),
	s(
		{trig = "set", dscr="Make a set"},
		fmta("\\{<>\\}", { i(1)}),
		{condition = in_mathzone}
	),
	s(
		{trig = "opn", dscr="Operation", priority=-10},
		fmta(
			"<>: <> \\to <> ",
			{ i(1, "f"), i(2, "\\mathbb{N}"), i(3, "\\mathbb{R}")}
		),
		{condition = in_mathzone}
	),
	s(
		{trig = "xopn", dscr="Operation", priority=-10},
		fmta(
			"<>: <> \\times <> \\to <> ",
			{ i(1, "f"), i(2, "\\mathbb{N}"), i(3, "\\mathbb{N}"), i(4, "\\mathbb{R}")}
		),
		{condition = in_mathzone}
	),
	s(
		{trig = "basis", dscr="Basis"},
		fmta(
			"{}_{<>}[<>]_{<>}",
			{ i(1), i(2, "f"), i(3)}
		),
		{condition = in_mathzone}
	),
	s(
		{trig = "Repr", dscr="Representing Matrix"},
		fmta(
			"{}_{<>}[<>]",
			{ i(1), i(2, "f")}
		),
		{condition = in_mathzone}
	),
	s(
		{trig = "Genr", dscr="Submodule Generator"},
		fmta(
			"{}_{<>}\\langle <> \\rangle",
			{ i(1), i(2, "f")}
		),
		{condition = in_mathzone}
	),

	s(
		{trig="//", dscr="Fraction", wordTrig=false},
		fmta(
			"\\frac{<>}{<>}",
			{i(1), i(2)}
		),
		{ condition = in_mathzone}
	),
	s(
		{trig="([[\\%w][%{.*%}][%(.*%)][%w]]+)%/", dscr="Auto expand first fraction", wordTrig=false, regTrig=true},
		fmta(
			"\\frac{<>}{<>}",
			{
				f( function(_, snip) return snip.captures[1] end ),
				i(1)
			}
		),
		{ condition = in_mathzone}
	),


	s(
		{trig="(%_%{%d*)%}(%d)", regTrig=true, wordTrig=false, priority=10, dscr="auto-indent variables"},
		fmta(
			"<><>}",
			{
				f( function(_, snip) return snip.captures[1] end),
				f( function(_, snip) return snip.captures[2] end),
			}
		),
		{ condition = in_mathzone}
	),
	s(
		{trig="([%a%)%]%}])(%d)", regTrig=true, wordTrig=false, priority=-1, dscr="auto-indent variables 2"},
		fmta(
			"<>_{<>}",
			{
				f( function(_, snip) return snip.captures[1] end),
				f( function(_, snip) return snip.captures[2] end),
			}
		),
		{ condition = in_mathzone}
	),
}
