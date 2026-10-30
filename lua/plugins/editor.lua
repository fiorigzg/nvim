return {
    { -- jump anywhere on screen with labels (s / S)
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            { "s", function() require("flash").jump() end, mode = { "n", "x", "o" }, desc = "Flash" },
            { "S", function() require("flash").treesitter() end, mode = { "n", "x", "o" }, desc = "Flash treesitter" },
            { "r", function() require("flash").remote() end, mode = "o", desc = "Remote flash" },
        },
    },

    { -- autopairs for brackets and quotes
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {},
    },

    { -- ys / ds / cs to add / delete / change surroundings
        "kylechui/nvim-surround",
        event = "VeryLazy",
        opts = {},
    },

    { -- find and replace across files
        "MagicDuck/grug-far.nvim",
        cmd = "GrugFar",
        opts = {},
        keys = {
            { "<Space>ss", function() require("grug-far").open() end, desc = "Search and replace" },
            {
                "<Space>sw",
                function() require("grug-far").open({ prefills = { search = vim.fn.expand("<cword>") } }) end,
                desc = "Replace word under cursor",
            },
            { "<Space>sw", function() require("grug-far").with_visual_selection() end, mode = "x", desc = "Replace selection" },
            {
                "<Space>sf",
                function() require("grug-far").open({ prefills = { paths = vim.fn.expand("%") } }) end,
                desc = "Replace in current file",
            },
        },
    },

    { -- highlight and list TODO/FIXME/NOTE comments
        "folke/todo-comments.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = { signs = false },
        keys = {
            { "<Space>tt", function() Snacks.picker.todo_comments() end, desc = "Todo list" },
            { "<Space>tn", function() require("todo-comments").jump_next() end, desc = "Next todo" },
            { "<Space>tp", function() require("todo-comments").jump_prev() end, desc = "Prev todo" },
        },
    },

    { -- git signs in gutter, hunks, blame
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            on_attach = function(bufnr)
                local gs = require("gitsigns")
                local function map(mode, lhs, rhs, desc)
                    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
                end

                map("n", "]h", function() gs.nav_hunk("next") end, "Next hunk")
                map("n", "[h", function() gs.nav_hunk("prev") end, "Prev hunk")
                map("n", "<Space>gp", gs.preview_hunk, "Preview hunk")
                map("n", "<Space>gS", gs.stage_hunk, "Stage/unstage hunk")
                map("n", "<Space>gr", gs.reset_hunk, "Reset hunk")
                map("n", "<Space>gR", gs.reset_buffer, "Reset buffer")
                map("n", "<Space>gb", function() gs.blame_line({ full = true }) end, "Blame line")
                map("n", "<Space>gB", gs.blame, "Blame file")
                map("n", "<Space>gd", gs.diffthis, "Diff file")
            end,
        },
    },
}
