require("telescope").setup()


--
-- keybuildings
--

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Open telescope 
map('n', '<Space>fg', '<Cmd>Telescope live_grep<CR>', opts)
map('n', '<Space>ff', '<Cmd>Telescope find_files<CR>', opts)
map('n', '<Space>fs', '<Cmd>Telescope grep_string<CR>', opts)

