-- Plugin keymaps live next to their plugin spec in lua/plugins/
local keymap = vim.keymap

keymap.set("n", "<Esc>", "<Cmd>nohlsearch<CR>")

-- Windows
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Window left" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Window down" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Window up" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Window right" })
keymap.set("n", "<C-Up>", "<Cmd>resize +2<CR>", { desc = "Increase height" })
keymap.set("n", "<C-Down>", "<Cmd>resize -2<CR>", { desc = "Decrease height" })
keymap.set("n", "<C-Left>", "<Cmd>vertical resize -2<CR>", { desc = "Decrease width" })
keymap.set("n", "<C-Right>", "<Cmd>vertical resize +2<CR>", { desc = "Increase width" })

-- Buffers
keymap.set("n", "<A-,>", "<Cmd>bprevious<CR>", { desc = "Previous buffer" })
keymap.set("n", "<A-.>", "<Cmd>bnext<CR>", { desc = "Next buffer" })

-- Keep selection when indenting
keymap.set("x", "<", "<gv")
keymap.set("x", ">", ">gv")

-- Move lines
keymap.set("n", "<A-j>", "<Cmd>m .+1<CR>==", { desc = "Move line down" })
keymap.set("n", "<A-k>", "<Cmd>m .-2<CR>==", { desc = "Move line up" })
keymap.set("x", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down", silent = true })
keymap.set("x", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up", silent = true })

-- Diagnostics
keymap.set("n", "<Space>do", vim.diagnostic.open_float, { desc = "Line diagnostics" })
keymap.set("n", "<Space>dp", function() vim.diagnostic.jump({ count = -1, float = true }) end, { desc = "Prev diagnostic" })
keymap.set("n", "<Space>dn", function() vim.diagnostic.jump({ count = 1, float = true }) end, { desc = "Next diagnostic" })
keymap.set("n", "<Space>dt", function()
    vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "Toggle diagnostics" })
