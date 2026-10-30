-- nvim-treesitter (main branch): only installs parsers, highlighting is started by Neovim itself.
-- Compiling parsers needs the tree-sitter CLI, it is installed via mason (see lsp.lua).
local parsers = {
    "bash", "c", "cpp", "css", "diff", "gitcommit", "html", "javascript", "json", "latex", "lua",
    "markdown", "markdown_inline", "python", "query", "regex", "toml", "tsx", "typescript",
    "vim", "vimdoc", "yaml",
}

return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").install(parsers)

        vim.api.nvim_create_autocmd("FileType", {
            group = vim.api.nvim_create_augroup("UserTreesitter", {}),
            callback = function(ev)
                if pcall(vim.treesitter.start, ev.buf) then
                    vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end
            end,
        })
    end,
}
