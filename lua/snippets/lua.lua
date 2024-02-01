local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local rep = require("luasnip.extras").rep

return {
	s(
		{trig="add;is", dscr="Inner Snip function"},
		fmt(
			"inner_snip(\"{}\", \"{} <> {}\", \"{}\"),",
			{
				i(1, "Name"),
				i(2, "Command"),
				i(3, "Command"),
				i(4, "Label")
			}
		)
	),
	s(
		"test", t("test 2")
	)
}, {
}



