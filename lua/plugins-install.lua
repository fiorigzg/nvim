require("lazy").setup({
    --
    -- themes
    --
    'folke/tokyonight.nvim',
    "EdenEast/nightfox.nvim",
    'projekt0n/github-nvim-theme',
    'maxmx03/fluoromachine.nvim',
    "lunarvim/synthwave84.nvim",
    'ellisonleao/gruvbox.nvim',

    --
    -- navigation
    --
    'nvim-tree/nvim-tree.lua', -- side tree of files and folders
    'romgrk/barbar.nvim',      -- top bar with open files
    {                          -- good searcher
        'nvim-telescope/telescope.nvim',
        tag = '0.1.2',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { -- fast navigation in files
        'phaazon/hop.nvim',
        branch = 'v2'
    },
    { -- for quick jumplist
        'cbochs/portal.nvim',
        dependencies = {
            "cbochs/grapple.nvim",
            "ThePrimeagen/harpoon"
        }
    },
    { -- for todos management
        'folke/todo-comments.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    'mrjones2014/smart-splits.nvim', -- windows resizing
    'nvim-pack/nvim-spectre',        -- find and replace across files


    --
    -- lspconfig
    --
    'neovim/nvim-lspconfig',             -- lsp config
    'williamboman/mason.nvim',           -- for easy lsp installing
    'williamboman/mason-lspconfig.nvim', -- for easy lsp installing
    {
        'linux-cultist/venv-selector.nvim',
        dependencies = {
            'neovim/nvim-lspconfig',
            'nvim-telescope/telescope.nvim',
            'mfussenegger/nvim-dap-python'
        },
        branch = "regexp",
        event = "VeryLazy",
    },

    --
    -- cmp
    --
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp", 'hrsh7th/cmp-path', 'hrsh7th/cmp-cmdline',
        }
    },


    --
    -- formatting
    --
    { -- for copilot
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
    },
    { -- ai like cursor
        "yetone/avante.nvim",
        event = "VeryLazy",
        version = false,
        keys = {
            {
                "<Space>a+",
                function()
                    local tree_ext = require("avante.extensions.nvim_tree")
                    tree_ext.add_file()
                end,
                desc = "Select file in NvimTree",
                ft = "NvimTree",
            },
            {
                "<Space>a-",
                function()
                    local tree_ext = require("avante.extensions.nvim_tree")
                    tree_ext.remove_file()
                end,
                desc = "Deselect file in NvimTree",
                ft = "NvimTree",
            },
        },
        build = "make",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons",
            "zbirenbaum/copilot.lua",
            {
                "HakonHarnes/img-clip.nvim",
                event = "VeryLazy",
                opts = {
                    default = {
                        embed_image_as_base64 = false,
                        prompt_for_file_name = false,
                        drag_and_drop = {
                            insert_mode = true,
                        },
                        use_absolute_path = true,
                    },
                },
            },
            {
                'MeanderingProgrammer/render-markdown.nvim',
                opts = {
                    file_types = { "markdown", "Avante" },
                },
                ft = { "markdown", "Avante" },
            },
        },
    },
    'windwp/nvim-autopairs', -- autopairs for brackets
    {                        -- for folding using lsp
        'kevinhwang91/nvim-ufo',
        dependencies = 'kevinhwang91/promise-async'
    },
    'mfussenegger/nvim-dap', -- debugger
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" }
    },
    { -- formatter
        'stevearc/conform.nvim',
        opts = {},
    },


    --
    -- highlight and beautify
    --
    { -- treesitter for highlighting
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate"
    },
    'yuezk/vim-js',                                                     -- JS syntax
    'maxmellon/vim-jsx-pretty',                                         -- JSX syntax
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} }, -- for good indentation view
    'yamatsum/nvim-cursorline',                                         -- highlight similar words
    'nvim-lualine/lualine.nvim',                                        -- status lines
    'nvim-tree/nvim-web-devicons',                                      -- Icons


    --
    -- git
    --
    "sindrets/diffview.nvim", -- show all file git diff


    --
    -- keybuindings
    --
    'folke/which-key.nvim',  -- keybindings controller
    -- { 'chrisgrieser/nvim-spider', lazy = true }, -- better w,b,e,ge
    'numToStr/Comment.nvim', -- fast comment plugin


    --
    -- other
    --
    'ThePrimeagen/vim-be-good', -- fast typing game
})
