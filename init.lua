-- Path to lazy.nvim plugin
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Clone lazy.nvim if it's not already installed
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

-- Prepend the path to lazy.nvim to runtime path
vim.opt.rtp:prepend(lazypath)

-- Basic settings
vim.wo.number = true
vim.opt.clipboard = 'unnamedplus'

-- Load plugins and their settings
require("plugins-install")
require("plugins-load")

-- Set colorscheme
vim.cmd('colorscheme gruvbox')

-- Indentation settings
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "javascript", "typescript", "javascriptreact", "typescriptreact", "html", "css" },
    callback = function()
        vim.bo.tabstop = 2
        vim.bo.shiftwidth = 2
        vim.bo.softtabstop = 2
    end,
})
