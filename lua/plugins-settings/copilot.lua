local keymap = vim.keymap

keymap.set('i', '<A-Right>', '<Plug>(copilot-accept-word)')
keymap.set('i', '<A-S-Right>', '<Plug>(copilot-accept-line)')
keymap.set('i', '<A-Left>', '<Plug>(copilot-dismiss)')
keymap.set('i', '<A-S-Left>', '<Plug>(copilot-suggest)')
keymap.set('i', '<A-[', '<Plug>(copilot-previous)')
keymap.set('i', '<A-]', '<Plug>(copilot-next)')
