-- https://github.com/mrjones2014/smart-splits.nvim
require('smart-splits').setup({
  resize_mode = {
    silent = true,
    hooks = {
      on_enter = function()
        vim.notify('Enter resize mode')
      end,
      on_leave = function()
        vim.notify('Exit resize mode')
      end,
    },
  },
})

-- 
-- keybindings
--
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "<Space>rr", function()
  require("smart-splits").start_resize_mode()
end, { desc = "Start resize mode" })

keymap.set("n", "<C-k>", function() require("smart-splits").move_cursor_up() end, { desc = "Move cursor up" })
keymap.set("n", "<C-j>", function() require("smart-splits").move_cursor_down() end, { desc = "Move cursor down" })
keymap.set("n", "<C-l>", function() require("smart-splits").move_cursor_right() end, { desc = "Move cursor right" })
keymap.set("n", "<C-h>", function() require("smart-splits").move_cursor_left() end, { desc = "Move cursor left" })

keymap.set("n", "<Space>rsu", function() require("smart-splits").swap_buf_up() end, { desc = "Swap buf up" })
keymap.set("n", "<Space>rsd", function() require("smart-splits").swap_buf_down() end, { desc = "Swap buf down" })
keymap.set("n", "<Space>rsr", function() require("smart-splits").swap_buf_right() end, { desc = "Swap buf right" })
keymap.set("n", "<Space>rsl", function() require("smart-splits").swap_buf_left() end, { desc = "Swap buf left" })

