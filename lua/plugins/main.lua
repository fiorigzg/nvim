vim.cmd [[packadd packer.nvim]]


--
-- including packer configs
--
require('plugins/nvimTree')
require('plugins/comment')
require('plugins/barbar')
require('plugins/telescope')
require('plugins/ufo')
require('plugins/prettyFold')
require('plugins/treesitter')
require('plugins/hop')
require('plugins/indentBlankline')
require('plugins/codeium')
require('plugins/toggleterm')
require('plugins/whichKey')
require('plugins/spider')
require('plugins/twilight')
require('plugins/portal')
require('plugins/cursorline')
require('plugins/lspconfig')
require('plugins/cmp')
require('plugins/lualine')
-- require('plugins/coc')


-- 
-- plugins installation use packer
--
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- packer update


  -- 
  -- themes
  --
  use 'folke/tokyonight.nvim'
  use 'EdenEast/nightfox.nvim'
  use 'sickill/vim-monokai'
  use 'rebelot/kanagawa.nvim'


  -- 
  -- navigation
  --
  use 'nvim-tree/nvim-tree.lua' -- side tree of files and folders
	use 'romgrk/barbar.nvim' -- top bar with open files
  use { -- good searcher
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		requires = { 'nvim-lua/plenary.nvim' }
	}
  use { -- fast navigation in files
    'phaazon/hop.nvim',
    branch = 'v2'
  }
  use 'cbochs/portal.nvim' -- for quick jumplist


  -- 
  -- lspconfig
  --
  use 'neovim/nvim-lspconfig' -- lsp config 
  use 'williamboman/mason.nvim' -- for easy lsp installing
  use 'williamboman/mason-lspconfig.nvim' -- for easy lsp installing


  -- 
  -- cmp 
  --
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp", 'hrsh7th/cmp-path', 'hrsh7th/cmp-cmdline', 'saadparwaiz1/cmp_luasnip'
    }
  }
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'
  -- use { -- for AI friend
  --   "jcdickinson/http.nvim",
  --   run = "cargo build --workspace --release"
  -- }
  -- use { -- AI friend in cmp
  --   "jcdickinson/codeium.nvim",
  --   requires = {
  --     -- "jcdickinson/http.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "hrsh7th/nvim-cmp",
  --   },
  -- }


  -- 
  -- coc
  --
  -- use { 'neoclide/coc.nvim', branch = 'release' }
  -- use { 'neoclide/coc-tsserver', run = 'yarn install --frozen-lockfile' }
  -- use { 'fannheyward/coc-pyright', run = 'yarn install --frozen-lockfile' }
  -- use { 'josa42/coc-lua', run = 'yarn install --frozen-lockfile' }
  -- use { 'neoclide/coc-prettier', run = 'yarn install --frozen-lockfile' }
  -- use { 'neoclide/coc-html', run = 'yarn install --frozen-lockfile' }
  -- use { 'neoclide/coc-css', run = 'yarn install --frozen-lockfile' }
  -- use { 'neoclide/coc-json', run = 'yarn install --frozen-lockfile' }
  -- use { 'weirongxu/coc-explorer', run = 'yarn install --frozen-lockfile' }
  -- use { 'neoclide/coc-snippets', run = 'yarn install --frozen-lockfile' }


  --
  -- formatting
  --
	use 'Exafunction/codeium.vim' -- AI friend
  use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'} -- for folding using lsp


  --
  -- highlight and beautify
  --
  use { -- treesitter for highlighting
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate"
  }
	use 'yuezk/vim-js' -- JS syntax
	use 'maxmellon/vim-jsx-pretty' -- JSX syntax
	use 'anuvyklack/pretty-fold.nvim' -- for good view of folds
  use "lukas-reineke/indent-blankline.nvim" -- for good indentation view
  use 'folke/twilight.nvim' -- for good night mode
  use 'yamatsum/nvim-cursorline' -- highlight similar words
  use 'nvim-lualine/lualine.nvim' -- status line


  --
  -- git
  --
  use "sindrets/diffview.nvim" -- show all file git diff


  --
  -- terminal
  --
  use 'akinsho/toggleterm.nvim' -- terminal


  --
  -- keybuindings
  --
  use 'folke/which-key.nvim' -- keybindings controller
  use 'chrisgrieser/nvim-spider' -- better w,b,e,ge
  use 'numToStr/Comment.nvim' -- fast comment plugin 


  -- 
  -- other
  --
  use 'ThePrimeagen/vim-be-good' -- fast typing game
end)
