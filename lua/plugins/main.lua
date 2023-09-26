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
require('plugins/twilight')
require('plugins/portal')
require('plugins/cursorline')
require('plugins/lspconfig')
require('plugins/cmp')
require('plugins/lualine')
require('plugins/leetcode')
require('plugins/nvimAutopairs')
require('plugins/todoComments')
require('plugins/smartSplits')
-- require('plugins/spider')


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
  use "lunarvim/synthwave84.nvim"


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
  use {
    'folke/todo-comments.nvim', -- for todos management
    requires = {'nvim-lua/plenary.nvim'}
  }
  use('mrjones2014/smart-splits.nvim') -- windows resizing


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


  --
  -- formatting
  --
	use 'Exafunction/codeium.vim' -- AI friend
  use 'windwp/nvim-autopairs' -- autopairs
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
  use 'nvim-lualine/lualine.nvim' -- status lines


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
  -- use 'chrisgrieser/nvim-spider' -- better w,b,e,ge
  use 'numToStr/Comment.nvim' -- fast comment plugin 


  -- 
  -- other
  --
  use 'ThePrimeagen/vim-be-good' -- fast typing game
  use 'ianding1/leetcode.vim' -- for leetcode
end)
