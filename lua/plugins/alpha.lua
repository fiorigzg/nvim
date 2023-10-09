local alpha = require("alpha")
local theme = require("alpha.themes.dashboard")

-- Set header
theme.section.header.val = {
  "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░██████████████████░░░░░░",
  "░░░░██░░░░░░░░░░░░░░░░░░██░░░░",
  "░░░█░░░░░░░░░░░░░░░░░░░░░░█░░░",
  "░░█░░░░░░░░░░░░░░░░░░░░░░░░█░░",
  "░░█░░░░░░░░░░░░░░░░░░░░░░░░█░░",
  "░░██░░░░░░░░░░░░░░░░░░░░░░██░░",
  "░░████░░░░░░░░░░░░░░░░░░████░░",
  "░░██░░██████████████████░░██░░",
  "░░██░░░░░░░░░░██░░░░░░░░░░██░░",
  "░░██░░░░░░░░░░██░░░░░░░░░░██░░",
  "░░██░░░░░░░░░░██░░░░░░░░░░██░░",
  "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
  "░      Gha'arn paraban       ░",
  "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░"
}

-- Set menu
theme.section.buttons.val = {
  theme.button("c", "C > Open code", ":e ~/code/ <CR>"),
  theme.button( "e", "E > New file" , ":ene <BAR> startinsert <CR>"),
  theme.button( "r", "R > Recent files"   , ":Telescope oldfiles<CR>"),
  theme.button( "s", "S > Settings" , ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
  theme.button( "q", "Q > Quit NVIM", ":qa<CR>"),
}

alpha.setup(theme.opts)

-- Disable folding on alpha buffer
vim.cmd([[
  autocmd FileType alpha setlocal nofoldenable
]])
