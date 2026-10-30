-- snacks.nvim: picker, file explorer, notifications, indent guides and other small utilities
return {
    "folke/snacks.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        bigfile = { enabled = true },
        explorer = { enabled = true },
        indent = { enabled = true, animate = { enabled = false } },
        input = { enabled = true },
        notifier = { enabled = true },
        picker = {
            enabled = true,
            sources = {
                files = { hidden = true },
                grep = { hidden = true },
                explorer = { hidden = true, ignored = true },
            },
        },
        quickfile = { enabled = true },
        words = { enabled = true }, -- highlight references of word under cursor
    },
    keys = {
        -- find
        { "<Space><Space>", function() Snacks.picker.smart() end, desc = "Smart find files" },
        { "<Space>ff", function() Snacks.picker.files() end, desc = "Files" },
        { "<Space>fg", function() Snacks.picker.grep() end, desc = "Grep" },
        { "<Space>fs", function() Snacks.picker.grep_word() end, desc = "Grep word/selection", mode = { "n", "x" } },
        { "<Space>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
        { "<Space>fr", function() Snacks.picker.recent() end, desc = "Recent files" },
        { "<Space>fl", function() Snacks.picker.lines() end, desc = "Lines in buffer" },
        { "<Space>fh", function() Snacks.picker.help() end, desc = "Help" },
        { "<Space>fk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
        { "<Space>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Config files" },
        { "<Space>fR", function() Snacks.picker.resume() end, desc = "Resume last picker" },
        { "<Space>fn", function() Snacks.picker.notifications() end, desc = "Notifications" },
        { "<Space>fu", function() Snacks.picker.undo() end, desc = "Undo history" },

        -- diagnostics / lsp lists
        { "<Space>dl", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer diagnostics" },
        { "<Space>dL", function() Snacks.picker.diagnostics() end, desc = "Project diagnostics" },
        { "<Space>lo", function() Snacks.picker.lsp_symbols() end, desc = "Document symbols" },
        { "<Space>lO", function() Snacks.picker.lsp_workspace_symbols() end, desc = "Workspace symbols" },

        -- explorer
        { "<Space>e", function() Snacks.explorer() end, desc = "File explorer" },
        { "<C-A-b>", function() Snacks.explorer() end, desc = "File explorer" },

        -- git
        { "<Space>gs", function() Snacks.picker.git_status() end, desc = "Git status" },
        { "<Space>gl", function() Snacks.picker.git_log() end, desc = "Git log" },
        { "<Space>gf", function() Snacks.picker.git_log_file() end, desc = "Git log of file" },
        { "<Space>go", function() Snacks.gitbrowse() end, desc = "Open in browser", mode = { "n", "x" } },

        -- buffers
        { "<A-c>", function() Snacks.bufdelete() end, desc = "Close buffer" },
        { "<Space>bd", function() Snacks.bufdelete() end, desc = "Close buffer" },
        { "<Space>bo", function() Snacks.bufdelete.other() end, desc = "Close other buffers" },

        -- jump between references of word under cursor
        { "]]", function() Snacks.words.jump(vim.v.count1) end, desc = "Next reference" },
        { "[[", function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev reference" },
    },
}
