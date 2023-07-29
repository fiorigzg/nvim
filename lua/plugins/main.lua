vim.cmd [[packadd packer.nvim]]

require('plugins/nvimTree')
require('plugins/comment')
require('plugins/barbar')
require('plugins/treesitter')
require('plugins/telescope')

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'dracula/vim'
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
end)
