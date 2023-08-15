--
-- keybindings
--
keymap = vim.keymap
opts = { noremap = true, silent = true, expr = true }

keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, opts)
keymap.set('i', '<C-PageUp>', function() return vim.fn['codeium#CycleCompletions'](1) end, opts)
keymap.set('i', '<C-PageDown>', function() return vim.fn['codeium#CycleCompletions'](-1) end, opts)
keymap.set('i', '<C-x>', function() return vim.fn['codeium#Clear']() end, opts)
