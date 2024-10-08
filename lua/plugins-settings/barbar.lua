require('barbar').setup {
    icons = {
        diagnostics = {
            [vim.diagnostic.severity.ERROR] = { enabled = true, icon = 'e' },
            [vim.diagnostic.severity.WARN] = { enabled = true, icon = 'w' },
            [vim.diagnostic.severity.INFO] = { enabled = true, icon = 'i' },
            [vim.diagnostic.severity.HINT] = { enabled = true, icon = 'h' },
        },
        gitsigns = {
            added = { enabled = true, icon = '+' },
            changed = { enabled = true, icon = '~' },
            deleted = { enabled = true, icon = '-' },
        }
    }
}


--
-- keybindings
--
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
keymap.set('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
keymap.set('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
keymap.set('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
keymap.set('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
keymap.set('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
keymap.set('n', '<A-C>', '<Cmd>BufferCloseAllButCurrentOrPinned<CR>', opts)
keymap.set('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
keymap.set('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
keymap.set('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
keymap.set('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
keymap.set('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)
