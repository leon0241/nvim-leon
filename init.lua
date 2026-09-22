-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('lua/pack-plugins')

require('lua/mappings')

require('lua/options')

require('lua/plugins/init')
