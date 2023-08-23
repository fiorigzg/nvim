--
-- keybindings
--
local keymap = vim.keymap
local opts = { noremap = true, silent = true, expr = true }

keymap.set('i', '<A-Enter>', function () return vim.fn['codeium#Accept']() end, opts)
keymap.set('i', '<A-n>', function() return vim.fn['codeium#CycleCompletions'](1) end, opts)
keymap.set('i', '<A-p>', function() return vim.fn['codeium#CycleCompletions'](-1) end, opts)
keymap.set('i', '<A-c>', function() return vim.fn['codeium#Clear']() end, opts)
