require('portal').setup {}

--
-- keybindings
--
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "<leader>o", "<cmd>Portal jumplist backward<cr>")
keymap.set("n", "<leader>i", "<cmd>Portal jumplist forward<cr>")
