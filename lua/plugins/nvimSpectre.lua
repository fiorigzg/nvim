require('spectre').setup {}

--
-- keybuildings
--
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set('n', '<Space>ss', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', opts)
keymap.set('v', '<Space>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', opts)
keymap.set('n', '<Space>sf', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', opts)
