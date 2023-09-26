-- https://github.com/folke/todo-comments.nvim
require('todo-comments').setup {
  signs = false
}

-- 
-- keybindings
--
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set('n', '<Space>tq', '<Cmd>TodoQuickFix<CR>', opts)
keymap.set('n', '<Space>tl', '<Cmd>TodoLocList<CR>', opts)
keymap.set('n', '<Space>tt', '<Cmd>TodoTelescope<CR>', opts)

keymap.set("n", "<Space>tn", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

keymap.set("n", "<Space>tp", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })
