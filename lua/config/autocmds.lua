local group = vim.api.nvim_create_augroup("UserConfig", {})

vim.api.nvim_create_autocmd("FileType", {
    group = group,
    pattern = { "javascript", "typescript", "javascriptreact", "typescriptreact", "html", "css", "json", "yaml", "lua" },
    callback = function()
        vim.bo.tabstop = 2
        vim.bo.shiftwidth = 2
        vim.bo.softtabstop = 2
    end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
    group = group,
    callback = function() vim.hl.on_yank() end,
})

-- Open PDFs in the system viewer instead of showing binary data
vim.api.nvim_create_autocmd("BufReadCmd", {
    group = group,
    pattern = "*.pdf",
    callback = function(ev)
        vim.ui.open(ev.file)
        vim.schedule(function()
            if vim.api.nvim_buf_is_valid(ev.buf) then
                vim.api.nvim_buf_delete(ev.buf, { force = true })
            end
        end)
    end,
})

-- Return to last edit position when reopening a file
vim.api.nvim_create_autocmd("BufReadPost", {
    group = group,
    callback = function(ev)
        local mark = vim.api.nvim_buf_get_mark(ev.buf, '"')
        if mark[1] > 0 and mark[1] <= vim.api.nvim_buf_line_count(ev.buf) then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})
