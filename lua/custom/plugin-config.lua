
-- ╭─────────────────────────────────────────────────────────╮
-- │              Setting up Customised Plugins              │
-- ╰─────────────────────────────────────────────────────────╯


-- ╭─────────────────────────────────────────────────────────╮
-- │                   Pick'n'mix plugins                    │
-- ╰─────────────────────────────────────────────────────────╯

-- mini.nvim setup
require("custom.plugins.mini-config")


-- ╭─────────────────────────────────────────────────────────╮
-- │                       Integration                       │
-- ╰─────────────────────────────────────────────────────────╯

-- Zotero Intergration
require("zotcite").setup()


-- ╭─────────────────────────────────────────────────────────╮
-- │                         Visual                          │
-- ╰─────────────────────────────────────────────────────────╯

-- Git signs
require('custom.plugins.gitsigns')

-- Folding and UFO
require('custom.plugins.ufo')

-- Status Line
require('custom.plugins.lualine')

-- Which Key
require('which-key').add {
    { "<leader>c", group = "[C]ode" },
    { "<leader>c_", hidden = true },

    { "<leader>d", group = "[D]ocument" },
    { "<leader>d_", hidden = true },

    { "<leader>l", group = "[L]azygit" },
    { "<leader>l_", hidden = true },

    { "<leader>h", group = "Git [H]unk" },
    { "<leader>h_", hidden = true },

    { "<leader>r", group = "[R]ename" },
    { "<leader>r_", hidden = true },

    { "<leader>s", group = "[S]earch in Files" },
    { "<leader>s_", hidden = true },

    { "<leader>f", group = "[F]ind Files" },
    { "<leader>f_", hidden = true },

    { "<leader>t", group = "[T]oggle" },
    { "<leader>t_", hidden = true },

    { "<leader>w", group = "[W]orkspace" },
    { "<leader>w_", hidden = true },

    { "<leader>zf", group = "[Z]otero Citation" },
}
-- register which-key VISUAL mode
-- required for visual <leader>hs (hunk stage) to work
require('which-key').add({
    { "<leader>", group = "VISUAL <leader>", mode = "v" },
    { "<leader>h", desc = "Git [H]unk", mode = "v" },
}, { mode = 'v' })



-- ╭─────────────────────────────────────────────────────────╮
-- │                       Formatting                        │
-- ╰─────────────────────────────────────────────────────────╯

-- Set up surround.nvim
require("nvim-surround").setup()

-- Autopairs
require('nvim-autopairs').setup({
  disable_filetype = { "tex" },
})

-- Git signs
require('custom.plugins.marks')

-- ╭─────────────────────────────────────────────────────────╮
-- │                Code and file Navigation                 │
-- ╰─────────────────────────────────────────────────────────╯

-- Nvim Tree
require("nvim-tree").setup {}

-- Harpoon setup
local harpoon = require("harpoon")
-- This thing is required
harpoon:setup()

local harpoon_extensions = require("harpoon.extensions")
harpoon:extend(harpoon_extensions.builtins.highlight_current_file())

vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
    { desc = "Open harpoon window" })

vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end)

vim.keymap.set("n", "<leader>hl", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-Z>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-X>", function() harpoon:list():next() end)


-- Treesitter
-- Defer Treesitter setup after first render to improve startup time of 'nvim {filename}'
vim.defer_fn(function()
  require("custom.plugins.treesitter")
end, 0)

require("custom.plugins.telescope")

-- ╭─────────────────────────────────────────────────────────╮
-- │                    LSP Configuration                    │
-- ╰─────────────────────────────────────────────────────────╯
-- LSP Config
require("custom.lspconfig")

-- DAP/Debugging
-- require("lsp.debug")
