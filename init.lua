-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- todo

-- Install lazy package manager
require("lazy-install")

-- Plugins
require("lazy-plugins")

-- Neovim options
require("custom.options")

-- Plugin setups
require("custom.plugin-config")

-- Mappings
require("custom.mappings")



require("custom.init")

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
