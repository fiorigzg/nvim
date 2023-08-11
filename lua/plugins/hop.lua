require('hop').setup {}


--
-- keybuildings
--
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Hop
map('n', '<Space>hw', '<Cmd>HopWord<CR>', opts)
map('n', '<Space>ha', '<Cmd>HopAnywhere<CR>', opts)
map('n', '<Space>hv', '<Cmd>HopVertical<CR>', opts)
map('n', '<Space>hp', '<Cmd>HopPattern<CR>', opts)
map('n', '<Space>hl', '<Cmd>HopLineStart<CR>', opts)
map('n', '<Space>hc', '<Cmd>HopChar1<CR>', opts)
