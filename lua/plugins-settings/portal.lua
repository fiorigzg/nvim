require('portal').setup {}

--
-- keybindings
--
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "<Space>po", "<cmd>Portal jumplist backward<cr>", opts)
keymap.set("n", "<Space>pi", "<cmd>Portal jumplist forward<cr>", opts)
