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
    {                                    -- select venv python
        "linux-cultist/venv-selector.nvim",
        dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
        event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
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
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
    },
    {
        "robitx/gp.nvim"
    },
    'windwp/nvim-autopairs', -- autopairs for brackets
    {                        -- for folding using lsp
        'kevinhwang91/nvim-ufo',
        dependencies = 'kevinhwang91/promise-async'
    },
    'mfussenegger/nvim-dap', -- debugger
    { "rcarriga/nvim-dap-ui",                dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
    {                        -- formatter
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
    'yuezk/vim-js',                                                                                                         -- JS syntax
    'maxmellon/vim-jsx-pretty',                                                                                             -- JSX syntax
    { "lukas-reineke/indent-blankline.nvim", main = "ibl",                                                       opts = {} }, -- for good indentation view
    'yamatsum/nvim-cursorline',                                                                                             -- highlight similar words
    'nvim-lualine/lualine.nvim',                                                                                            -- status lines
    'nvim-tree/nvim-web-devicons',                                                                                          -- Icons
    'goolord/alpha-nvim',                                                                                                   -- start screen


    --
    -- git
    --
    "sindrets/diffview.nvim", -- show all file git diff


    --
    -- terminal
    --
    'akinsho/toggleterm.nvim', -- terminal


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
