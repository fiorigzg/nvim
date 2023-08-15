require('twilight').setup {}

--
-- keybindings
--
keymap = vim.keymap
opts = { noremap = true, silent = true }

keymap.set('n', '<C-n>', '<Cmd>Twilight<CR>', opts)
