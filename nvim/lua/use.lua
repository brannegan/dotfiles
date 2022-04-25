function get_setup(name)
  return string.format('require("setup/%s")', name)
end
return require('packer').startup(function()

    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}

    -- Development
    --use {'tpope/vim-fugitive'}
    use {'tpope/vim-surround'}
    use {'tpope/vim-repeat'}
    use {'windwp/nvim-autopairs', config = require('plugins/autopairs')}

    -- Color scheme
    use {'kyazdani42/nvim-web-devicons', config = require('plugins/devicon')}
    use {'sainnhe/gruvbox-material'}

    -- Telescope
    use {'nvim-lua/plenary.nvim'}
    use {'nvim-lua/popup.nvim'}
    use {'nvim-telescope/telescope.nvim',
      requires = {
        'nvim-telescope/telescope-ui-select.nvim',
      },
      config = require('plugins/telescope')
    }

    -- LSP config
    use {'neovim/nvim-lspconfig'}
    use {'nvim-lua/lsp-status.nvim'}

    -- Completion - use either one of this
    use {'hrsh7th/nvim-cmp', 
      requires = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'saadparwaiz1/cmp_luasnip',
      },
      config = require('plugins/nvim-cmp')
    }
    -- {'hrsh7th/cmp-cmdline', after = 'nvim-cmp'}, 
    -- Snippets
    use { 'L3MON4D3/LuaSnip' }

    -- Better syntax
    use {'nvim-treesitter/nvim-treesitter',
          run = ':TSUpdate',
          config = require('plugins/treesitter')
    }
    --use {'nvim-treesitter/nvim-treesitter-textobjects'}
    --use {'nvim-treesitter/playground'}

    use {'hoob3rt/lualine.nvim', config = require('plugins/lualine')}
  
    -- DAP
    -- use {'mfussenegger/nvim-dap'}
    -- use {'nvim-telescope/telescope-dap.nvim'}
    -- use {'theHamsta/nvim-dap-virtual-text'}

    -- Rust
    use {'simrat39/rust-tools.nvim'}

    -- Terminal
    use {"akinsho/toggleterm.nvim", config = require('plugins/toggleterm')}

end)
