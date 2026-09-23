function nmap(maps)
	for _, map in ipairs(maps) do vim.keymap.set("n", map[1], map[2], map[3]) end
	return
end

function vmap(maps)
	for _, map in ipairs(maps) do vim.keymap.set("v", map[1], map[2], map[3]) end
	return
end

function nvmap(maps)
	for _, map in ipairs(maps) do vim.keymap.set({"n", "v"}, map[1], map[2], map[3]) end
	return
end

