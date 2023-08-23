require("telescope").setup()


--
-- keybindings
--
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set('n', '<Space>tg', '<Cmd>Telescope live_grep<CR>', opts)
keymap.set('n', '<Space>tf', '<Cmd>Telescope find_files<CR>', opts)
keymap.set('n', '<Space>ts', '<Cmd>Telescope grep_string<CR>', opts)

