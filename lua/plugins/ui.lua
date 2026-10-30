return {
    { -- colorscheme
        "ellisonleao/gruvbox.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("gruvbox").setup({})
            vim.cmd.colorscheme("gruvbox")
        end,
    },

    { -- status line
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = {
            options = {
                theme = "auto",
                globalstatus = true,
                section_separators = "",
                component_separators = "|",
            },
            tabline = {
                lualine_a = { { "buffers", symbols = { alternate_file = "" } } },
            },
        },
    },

    { -- keybindings hints
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            preset = "helix",
            spec = {
                { "<Space>b", group = "buffer" },
                { "<Space>d", group = "diagnostics" },
                { "<Space>f", group = "find" },
                { "<Space>g", group = "git" },
                { "<Space>l", group = "lsp" },
                { "<Space>s", group = "search/replace" },
                { "<Space>t", group = "todo" },
            },
        },
    },

    { -- render markdown in the buffer: headings, tables, latex as unicode (latex2text)
        "MeanderingProgrammer/render-markdown.nvim",
        ft = "markdown",
        opts = {
            latex = { enabled = true },
        },
        keys = {
            { "<Space>m", "<Cmd>RenderMarkdown toggle<CR>", desc = "Toggle markdown render" },
        },
    },

    { "nvim-tree/nvim-web-devicons", lazy = true },
}
