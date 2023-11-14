require("lazy").setup({
  -- 
  -- themes
  --
  'folke/tokyonight.nvim',
  'maxmx03/fluoromachine.nvim',
  "lunarvim/synthwave84.nvim",


  -- 
  -- navigation
  --
  'nvim-tree/nvim-tree.lua', -- side tree of files and folders
  'romgrk/barbar.nvim', -- top bar with open files
  { -- good searcher
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
  { -- fast navigation in files
    'phaazon/hop.nvim',
    branch = 'v2'
  },
  'cbochs/portal.nvim', -- for quick jumplist
  {
    'folke/todo-comments.nvim', -- for todos management
    dependencies = {'nvim-lua/plenary.nvim'}
  },
  'mrjones2014/smart-splits.nvim', -- windows resizing
  'nvim-pack/nvim-spectre',


  -- 
  -- lspconfig
  --
  'neovim/nvim-lspconfig', -- lsp config 
  'williamboman/mason.nvim', -- for easy lsp installing
  'williamboman/mason-lspconfig.nvim', -- for easy lsp installing
  { -- for venv selection(python)
    'linux-cultist/venv-selector.nvim',
    dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
    event = "VeryLazy"
  },


  -- 
  -- cmp 
  --
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp", 'hrsh7th/cmp-path', 'hrsh7th/cmp-cmdline', 'saadparwaiz1/cmp_luasnip'
    }
  },
  'L3MON4D3/LuaSnip',
  'rafamadriz/friendly-snippets',


  --
  -- formatting
  --
	'Exafunction/codeium.vim', -- AI friend
  'windwp/nvim-autopairs', -- autopairs
  { -- for folding using lsp
    'kevinhwang91/nvim-ufo', 
    dependencies = 'kevinhwang91/promise-async'
  },


  --
  -- highlight and beautify
  --
  { -- treesitter for highlighting
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate"
  },
	'yuezk/vim-js', -- JS syntax
	'maxmellon/vim-jsx-pretty', -- JSX syntax
	'anuvyklack/pretty-fold.nvim', -- for good view of folds
  "lukas-reineke/indent-blankline.nvim", -- for good indentation view
  'folke/twilight.nvim', -- for good night mode
  'yamatsum/nvim-cursorline', -- highlight similar words
  'nvim-lualine/lualine.nvim', -- status lines
  'nvim-tree/nvim-web-devicons', -- Icons
  'goolord/alpha-nvim', -- start screen

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
  'folke/which-key.nvim', -- keybindings controller
  -- 'chrisgrieser/nvim-spider', -- better w,b,e,ge
  'numToStr/Comment.nvim', -- fast comment plugin 


  -- 
  -- other
  --
  'ThePrimeagen/vim-be-good', -- fast typing game
--   'ianding1/leetcode.vim', -- for leetcode
})