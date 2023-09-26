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
    indent_markers = {
       icons = {
          corner = "└",
          edge = "│",
          item = "│",
          bottom = "─",
          none = " ",
        },
     },
     icons = {
        padding = " ",
        symlink_arrow = " ➛ ",
        show = {
          file = true,
          folder = true,
          folder_arrow = true,
          git = true,
          modified = true,
        },
        glyphs = {
	  default = "◫ ",
          symlink = "⇱ ",
          bookmark = "⇈ ",
          modified = "● ",
          folder = {
            arrow_closed = "▼ ",
            arrow_open = "▽ ",
            default = "▣ ",
            open = "▪ ",
	    empty = "□ ",
            empty_open = "▫ ",
            symlink = "◆ ",
            symlink_open = "◇",
          },
          git = {
            unstaged = "-",
            staged = "+",
            unmerged = "↮ ",
            renamed = "➙ ",
            untracked = "☐ ",
            deleted = "☒ ",
            ignored = "◌ ",
          },
      },
    },
  },
  diagnostics = {
    icons = {
       hint = "Ⓗ ",
       info = "Ⓘ ",
       warning = "Ⓦ ",
       error = "Ⓔ ",
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
