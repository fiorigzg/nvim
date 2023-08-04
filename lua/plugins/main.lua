vim.cmd [[packadd packer.nvim]]

require('plugins/nvimTree')
require('plugins/comment')
require('plugins/barbar')
require('plugins/treesitter')
require('plugins/telescope')
require('plugins/ufo')
require('plugins/prettyFold')

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'morhetz/gruvbox'
  use 'Mofiqul/dracula.nvim'
  use 'shaunsingh/nord.nvim'
  use 'folke/tokyonight.nvim'
  use 'EdenEast/nightfox.nvim'

  use 'nvim-tree/nvim-tree.lua'
  use 'numToStr/Comment.nvim'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate"
  }
	use 'romgrk/barbar.nvim'
	use 'Exafunction/codeium.vim'
	use 'yuezk/vim-js'
	use 'maxmellon/vim-jsx-pretty'
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}
  use 'anuvyklack/pretty-fold.nvim'
end)
