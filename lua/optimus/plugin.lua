-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
    'haorenW1025/completion-nvim',
    opt = true,
    requires = {{'hrsh7th/vim-vsnip', opt = true}, {'hrsh7th/vim-vsnip-integ', opt = true}}
  }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use {'nvim-telescope/telescope.nvim', tag = '0.1.x', 
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use { "catppuccin/nvim", as = "catppuccin" }
  use {
				"williamboman/nvim-lsp-installer",
				"williamboman/mason.nvim",
				"williamboman/mason-lspconfig.nvim",
				"neovim/nvim-lspconfig"
  }
	use {
		'VonHeikemen/lsp-zero.nvim',
		'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
		{'L3MON4D3/LuaSnip', run = "make install_jsregexp"}
	}
	use {'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional
		},
	}
	use {
		"windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
        require("nvim-autopairs").setup {}
    end
	}
	use {
		"majutsushi/tagbar",
			requires = {
				"universal-ctags/ctags"
			}
	}
-- 	use {
-- 		"phpactor/phpactor",
-- 		"gbprod/phpactor.nvim",
-- 			build = function()
-- 				require("phpactor.handler.update")()
-- 			end,
-- 		dependencies = {
-- 			"nvim-lua/plenary.nvim",
-- 			"neovim/nvim-lspconfig"
-- 		},
-- 		opts = {
-- 			-- you're options coes here
-- 		},
-- 	}
end)
