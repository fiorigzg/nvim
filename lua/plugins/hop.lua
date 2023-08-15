require('hop').setup {}


--
-- keybindings
--
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Hop
keymap.set('n', '<Space>hw', '<Cmd>HopWord<CR>', opts)
keymap.set('n', '<Space>ha', '<Cmd>HopAnywhere<CR>', opts)
keymap.set('n', '<Space>hv', '<Cmd>HopVertical<CR>', opts)
keymap.set('n', '<Space>hp', '<Cmd>HopPattern<CR>', opts)
keymap.set('n', '<Space>hl', '<Cmd>HopLineStart<CR>', opts)
keymap.set('n', '<Space>hc', '<Cmd>HopChar1<CR>', opts)
