require("toggleterm").setup {

}


--
-- keybuildings
--

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Open telescope 
map('n', [[<C-\>]], '<Cmd>ToggleTerm<CR>', opts)

-- interminal navigation
function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
  vim.keymap.set('t', [[<C-\>]], '<Cmd>ToggleTerm<CR>', opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

