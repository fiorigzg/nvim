-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true


-- 
-- set own icons
--
require("nvim-tree").setup {
  renderer = {
     icons = {
       glyphs = {
         git = {
            unstaged = "+",
            staged = "#",
            unmerged = "↮ ",
            renamed = "➙ ",
            untracked = "-",
            deleted = "☒ ",
            ignored = "◌ ",
          },
      },
    },
  },
  git = {
    enable = true,
    ignore = false,
  }
}


--
-- keybuildings
--
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set('n', '<C-A-b>', '<Cmd>NvimTreeToggle<CR>', opts) -- Toggle file explorer
