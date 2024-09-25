require("gp").setup {
}

--
-- keybindings
--
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set('n', '<Space>an', '<Cmd>GpChatNew<CR>', opts)
keymap.set('v', '<Space>ap', '<Cmd>GpChatPaste tabnew<CR>', opts)
