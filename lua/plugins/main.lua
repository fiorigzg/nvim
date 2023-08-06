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
require('plugins/lsp')
require('plugins/autocomplete')
require('plugins/treesitter')

-- 
-- plugins installation use packer
--
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- packer update

  -- 
  -- themes
  --
  use 'morhetz/gruvbox'
  use 'Mofiqul/dracula.nvim'
  use 'shaunsingh/nord.nvim'
  use 'folke/tokyonight.nvim'
  use 'EdenEast/nightfox.nvim'
  use 'julien/vim-colors-green'
  use 'sickill/vim-monokai'

  use 'nvim-tree/nvim-tree.lua' -- side tree of files and folders
  use 'numToStr/Comment.nvim' -- fast comment plugin 
	use 'romgrk/barbar.nvim' -- top bar with open files
	use 'Exafunction/codeium.vim' -- AI friend
	use { -- good searcher
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'} -- for folding
  use 'anuvyklack/pretty-fold.nvim' -- for good view of folds
  
  -- 
  -- lsp
  --
  use 'neovim/nvim-lspconfig' -- lsp config 
  use 'williamboman/mason.nvim' -- for easy lsp installing
  use 'williamboman/mason-lspconfig.nvim' -- for easy lsp installing
  
  -- 
  -- autocomplete
  --
  use {
      "hrsh7th/nvim-cmp",
      requires = {
        "hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp", 'hrsh7th/cmp-path', 'saadparwaiz1/cmp_luasnip'
      }
  }
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'

  --
  -- highlight
  --
  use { -- treesitter for highlighting
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate"
  }
	use 'yuezk/vim-js' -- JS syntax
	use 'maxmellon/vim-jsx-pretty' -- JSX syntax 
  use 'vim-python/python-syntax' -- python syntax 
end)
