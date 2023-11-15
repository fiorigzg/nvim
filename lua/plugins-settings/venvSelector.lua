require('venv-selector').setup {
  name = {"venv", "env"}
}

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set('n', '<Space>vs', '<Cmd>VenvSelect<CR>', opts)
keymap.set('n', '<Space>vc', '<Cmd>VenvSelectCached<CR>', opts)
