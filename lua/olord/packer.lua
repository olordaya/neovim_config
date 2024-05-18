-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	vim.api.nvim_set_hl(0,"NormalFloat", {bg = "none"})
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'vim-pandoc/vim-pandoc-syntax'
  use 'vim-pandoc/vim-pandoc'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.4',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use { "catppuccin/nvim",
  as = "catppuccin",
  config = function()
	  vim.cmd('colorscheme catppuccin')
  end
  }
  use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use ('theprimeagen/harpoon')
  use ('mbbill/undotree')
  use ('tpope/vim-fugitive')
  use {'christoomey/vim-tmux-navigator'}

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      --- Uncomment these if you want to manage LSP servers from neovim
       {'williamboman/mason.nvim'},
       {'williamboman/mason-lspconfig.nvim'},

      -- LSP Support
      {'neovim/nvim-lspconfig'},
      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lua'},
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'}
    }
  }
use ('jiangmiao/auto-pairs')
use ('Raimondi/delimitMate')
    -- Other plugins...
use ("lukas-reineke/indent-blankline.nvim")
  -- Lua
use {
  "ahmedkhalf/jupyter-nvim",
  run = ":UpdateRemotePlugins",
  config = function()
    require("jupyter-nvim").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}
  use { 'dccsillag/magma-nvim', run = ':UpdateRemotePlugins' }
  use {'luk400/vim-jukit'}
end)
