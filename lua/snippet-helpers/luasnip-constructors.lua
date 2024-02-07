local M = {}

local ls = require("luasnip")
local sn = ls.snippet_node
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local fmta = require('luasnip.extras.fmt').fmta

local conditions = require('snippet-helpers.luasnip-conditions')

local line_begin = conditions.line_begin
local in_mathzone = conditions.in_mathzone

-- General Snippet Types


---Snippet that has one block with surrounding text
---@param name string Shortcut to call the snippet
---@param command string LaTeX code to call
---@param label any Label for autocomplete(optional)
---@param cond any Expand condition(optional)
function M.inner_snip(name, command, label, cond, prio)
    if label == nil then label = "" end
    if cond == nil then cond = function() return true end end
    if prio == nil then prio = 0 end

    return s(
	{trig=name, dscr=label, wordTrig=false, priority=prio},
	fmta(command, { i(1) }),
	{ condition = cond}
    )
end

-- Snippet that inserts a latex object with no blocks
---@param name string Shortcut to call the snippet
---@param command string LaTeX code to call
---@param label any Label for autocomplete(optional)
---@param cond any Expand condition
function M.object(name, command, label, cond)
    if label == nil then label = "" end
    if cond == nil then cond = function() return true end end

    return s(
	{trig=name, dscr=label, wordTrig=false},
	t(command),
	{ condition = cond }
    )
end

-- object("sr", "^{2}", "square", in_mathzone),

---Snippet that inserts a LaTeX environment
---@param name string Shortcut to call the snippet
---@param command string LaTeX code to call
---@param label string Label for autocomplete(optional)
---@param cond any Expand condition
function M.env_snip(name, command, label, cond)
    if label == nil then label = "" end
    if cond == nil then cond = function() return true end end

    local start_string = "\\begin{" .. command .. "}"
    local end_string = "\\end{" .. command .. "}"
    local fmta_val = start_string .. "\n\t<>\n" .. end_string

    return s(
	{trig=name, dscr=label},
	fmta(fmta_val, { i(1)}),
	{ condition = line_begin and cond}
    )
end

-- Fonts

-- Turns |R into \mathbb{R} for some R
function M.mathbb_snippet(letter)
    return s(
	{trig= "|" .. letter, wordTrig=false},
	t("\\mathbb{" .. letter .. "}"),
	{ condition = in_mathzone }
    )
end

-- Adds a superscripted or subscripted symbol to a mathBB 
function M.mbb_super_sub(letter, super, sign)
    return s(
	{trig="\\mathbb{" .. letter .. "}" .. super, wordTrig=false},
	t("\\mathbb{" .. letter .. "}" .. sign .. "{" .. super .. "}"),
	{ condition = in_mathzone }
    )
end



-- Greek alphas
function M.create_alpha(snip, command)
    return s(
	{trig="@" .. snip, wordTrig=false},
	t("\\" .. command),
	{ condition = in_mathzone}
    )
end



-- Theorem box
function M.thmbox(name, command, label)
    local start_string = "\\begin{" .. command .. "}[<>]{<>}{<>}"
    local end_string = "\\end{" .. command .. "}"
    local fmta_val = start_string .. "\n\t<>\n" .. end_string

    return s(
	{trig=name, dscr=label},
	fmta(fmta_val, {
	    i(1, "Name"),
	    i(2, "Label"),
	    i(3, "Number"),
	    i(4),
	}),
	{ condition = line_begin}
    )
end


return M
