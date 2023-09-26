require("telescope").setup()


--
-- keybindings
--
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set('n', '<Space>fg', '<Cmd>Telescope live_grep<CR>', opts)
keymap.set('n', '<Space>ff', '<Cmd>Telescope find_files<CR>', opts)
keymap.set('n', '<Space>fs', '<Cmd>Telescope grep_string<CR>', opts)

