vim.wo.number = true

require('plugins/main')

vim.cmd [[colorscheme carbonfox]] -- default colorscheme

local set = vim.opt -- set options
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.expandtab = true
-- vim.cmd [[set tabstop=2]]
-- vim.cmd [[set shiftwidth=2]]
-- vim.cmd [[set softtabstop=2]]
-- vim.cmd [[set expandtab]]
