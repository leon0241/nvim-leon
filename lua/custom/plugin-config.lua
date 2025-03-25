
-- ╭─────────────────────────────────────────────────────────╮
-- │              Setting up Customised Plugins              │
-- ╰─────────────────────────────────────────────────────────╯


-- ╭─────────────────────────────────────────────────────────╮
-- │                   Pick'n'mix plugins                    │
-- ╰─────────────────────────────────────────────────────────╯

-- mini.nvim setup
require("custom.mini-config")


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
require('ufo').setup({
  provider_selector = function(bufnr, filetype, buftype)
    return {'treesitter', 'indent'}
  end,

  -- Time between the range to be highlighted and to be cleared while opening the folded line, `0` disables
  open_fold_hl_timeout = 400,

  -- Folds to close by default when the file opens
  close_fold_kinds_for_ft = {},

  -- Enables a function to capture the virtual text for the folded lines
  enable_get_fold_virt_text = false,

  -- Configure the options for preview window and remap the keys for current buffer and preview buffer if the preview window is displayed
  preview = {
    win_config = {
      border = 'rounded',
      winblend = 12,
      winhighlight = 20,
      maxheight = 20
    }
  }
})

-- Status Line
require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = 'catppuccin',
    component_separators = '|',
    section_separators = '',
  },
  sections = {
    lualine_a = { { 'mode', separator = { left = ''}, right_padding = 2 } },
    lualine_b = { {'filename', separator = { right = '' }}},
    lualine_c = {
      '%=', --[[ add your center components here in place of this comment ]]
    },
    lualine_x = {},
    lualine_y = { 'filetype', 'progress' },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename'}, lualine_b = {}, lualine_c = {},
    lualine_x = {}, lualine_y = {}, lualine_z = { 'location' },
  },
  tabline = {},
  extensions = { 'nvim-tree'},
})

-- Which Key
require('which-key').add {
    { "<leader>c", group = "[C]ode" },
    { "<leader>c_", hidden = true },
    { "<leader>d", group = "[D]ocument" },
    { "<leader>d_", hidden = true },
    { "<leader>g", group = "[G]it" },
    { "<leader>g_", hidden = true },
    { "<leader>h", group = "Git [H]unk" },
    { "<leader>h_", hidden = true },
    { "<leader>r", group = "[R]ename" },
    { "<leader>r_", hidden = true },
    { "<leader>s", group = "[S]earch" },
    { "<leader>s_", hidden = true },
    { "<leader>t", group = "[T]oggle" },
    { "<leader>t_", hidden = true },
    { "<leader>w", group = "[W]orkspace" },
    { "<leader>w_", hidden = true },
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


-- ╭─────────────────────────────────────────────────────────╮
-- │                Code and file Navigation                 │
-- ╰─────────────────────────────────────────────────────────╯

-- Autocomplete and snippet Config
require("custom.autocomplete")

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
  require("core.plugins.treesitter")
end, 0)


-- ╭─────────────────────────────────────────────────────────╮
-- │                    LSP Configuration                    │
-- ╰─────────────────────────────────────────────────────────╯
-- LSP Config
require("lsp.lspconfig")

-- DAP/Debugging
require("lsp.debug")
