local opt = vim.opt

-- UI
opt.number = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.termguicolors = true
opt.scrolloff = 8
opt.wrap = false
opt.winborder = "rounded"
opt.showmode = false -- mode is shown in lualine
opt.splitright = true
opt.splitbelow = true

-- Behaviour
opt.clipboard = "unnamedplus"
opt.mouse = "a"
opt.undofile = true
opt.updatetime = 250
opt.ignorecase = true
opt.smartcase = true
opt.confirm = true

-- Indentation (2 spaces for web files, see autocmds.lua)
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- Folding with treesitter, everything open by default
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldlevel = 99
opt.foldlevelstart = 99

-- Diagnostics
vim.diagnostic.config({
    severity_sort = true,
    virtual_text = { spacing = 2, prefix = "●" },
    float = { source = true },
})
