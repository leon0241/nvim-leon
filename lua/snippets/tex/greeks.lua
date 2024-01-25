local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local helper = require('luasnip-helper-funcs')
local inMath = helper.in_mathzone

local snippet_list = {}

local greek_letters = {
    a = {command = "alpha", upper = false},
    b = {command = "beta", upper = false},
    g = {command = "gamma", upper = true},
    d = {command = "delta", upper = true},
    e = {command = "epsilon", upper = false},
    z = {command = "zeta", upper = false},
    h = {command = "eta", upper = false},
    t = {command = "theta", upper = true},
    i = {command = "iota", upper = false},
    k = {command = "kappa", upper = false},
    l = {command = "lambda", upper = true},
    m = {command = "mu", upper = false},
    n = {command = "nu", upper = false},
    j = {command = "xi", upper = false},
    o = {command = "omricon", upper = false},
    p = {command = "pi", upper = true},
    r = {command = "rho", upper = false},
    s = {command = "sigma", upper = true},
    q = {command = "tau", upper = false},
    u = {command = "upsilon", upper = false},
    f = {command = "phi", upper = true},
    x = {command = "chi", upper = true},
    c = {command = "psi", upper = true},
    w = {command = "omega", upper = true},
}

local function create_snippet(snip, command)
    return s(
	"@" .. snip,
	t("\\" .. command),
	{ condition = inMath}
    )
end

-- Add greek letter snippets
for snip, data in pairs(greek_letters) do
    -- Insert the lower case case, e.g. @a -> \alpha
    table.insert(snippet_list, create_snippet(snip, data.command))

    -- If uppercase looks different from latin (this has to be done manually)
    if data.upper == true then
	-- Insert the upper case case, e.g. @A -> \Alpha
    	table.insert(
	    snippet_list,
	    create_snippet(string.upper(snip), data.command:gsub("^%l", string.upper))
	)
    end
end

-- Create snippet list
local manual_snippet_list = {
    s("pi", t("\\pi"), {condition = inMath})
}

-- Combine automated lists with manual list
for _, snippet in ipairs(manual_snippet_list) do
    table.insert(snippet_list, snippet)
end

-- Second list is autosnippets
return {}, snippet_list
