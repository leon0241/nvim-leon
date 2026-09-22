-- Basic Remaps

function nmap(maps)
	for _, map in ipairs(maps) do
		vim.keymap.set("n", map[1], map[2], map[3])
	end
	return
end

nmap({
	{"H", "^", { desc = "Start of Line"}},
	{"L", "$", { desc = "End of Line" }},
	{"j", "gj", { desc = "Physical next line" }},
	{"k", "gk", { desc = "Physical previous line" }}
})

vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })
