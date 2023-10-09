vim.wo.number = true

require('plugins/main')

vim.cmd [[colorscheme tokyonight-night]] -- default colorscheme

local set = vim.opt -- set options
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.expandtab = true

vim.opt.clipboard = 'unnamedplus'

-- 
-- keybindings
--
local keymap = vim.keymap
local opts = { noremap = true, silent = true }
