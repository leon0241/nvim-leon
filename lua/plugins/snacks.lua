vim.pack.add({
	'https://github.com/folke/snacks.nvim',
})

local Snacks = require("snacks")

Snacks.setup({
    picker = {
        enabled = "true",
        files = {
            ignored = true,
        }
    }
})

function nmap(maps)
	for _, map in ipairs(maps) do
		vim.keymap.set("n", map[1], map[2], map[3])
	end
	return
end

nmap({
    { "<leader>ff", function() Snacks.picker.files() end, {desc = "Find Files"} },
    { "<leader>/", function() Snacks.picker.grep() end, {desc = "Grep"} },
})
