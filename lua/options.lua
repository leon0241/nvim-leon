-- Command height to 0 for centered command line
vim.o.cmdheight = 0

require('vim._core.ui2').enable({
    enable = true,
    msg = {
        targets = "msg"
    }
})

-- Set colourscheme
vim.cmd.colorscheme "catppuccin-mocha"

-- remove highlight on search
vim.o.hlsearch = false

-- System Clipboard ("+)
vim.o.clipboard = 'unnamedplus'

-- Save undos across sessions
vim.o.undofile = true

-- Enable break indent
vim.o.breakindent = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.smartcase = true

-- Tab Options - setting to 4
vim.opt.shiftwidth=4
vim.opt.tabstop=4
vim.opt.expandtab=true

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- How many lines to keep on
vim.opt.scrolloff = 7

-- Status Line
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.foldcolumn = "1"

vim.opt.laststatus = 3

vim.wo.signcolumn= "yes"
