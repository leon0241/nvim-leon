local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local rep = require("luasnip.extras").rep

return {
	s(
		{trig="cll", dscr="Create Link"},
		fmt(
			"{<>}[<>]",
			{
				i(1, "Location"),
				i(2, "Alias"),
			}
		)
	),
	s(
		{trig="caa", dscr="Create Anchor"},
		fmt(
			"[<>]{<>}",
			{
				i(1, "Alias"),
				i(2, "Location"),
			}
		)
	),
}, {
}



