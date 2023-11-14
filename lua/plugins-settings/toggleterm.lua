require("toggleterm").setup {

}


--
-- keybindings
--
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set('n', [[<C-A-\>]], '<Cmd>ToggleTerm<CR>', opts)

-- interminal navigation
function _G.set_terminal_keymaps()
  opts = {buffer = 0}
  keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
  keymap.set('t', [[<C-A-\>]], '<Cmd>ToggleTerm<CR>', opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

