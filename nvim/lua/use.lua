function get_config(name)
  return string.format('require("plugins/%s")', name)
end

return require('packer').startup(function()

    -- Packer can manage itself as an optional plugin
   use {'wbthomason/packer.nvim', opt = true}

   -- Development
   --use {'tpope/vim-fugitive'}
   use {'tpope/vim-surround'}
   use {'tpope/vim-repeat'}
   use {'windwp/nvim-autopairs',
     config = get_config("autopairs")
   }
   use "tversteeg/registers.nvim"
  
   -- Color scheme
   use {'sainnhe/gruvbox-material'}
   use {'sainnhe/everforest'}
   use {'NvChad/nvim-colorizer.lua',
    config = require'colorizer'.setup()
  }

   -- Telescope
   use {'nvim-telescope/telescope.nvim',
     requires = {
       'nvim-lua/popup.nvim',
       'nvim-lua/plenary.nvim',
       'kyazdani42/nvim-web-devicons',
       'nvim-telescope/telescope-ui-select.nvim',
     },
     config = get_config("telescope")
   }

   -- Completion - use either one of this
   use {'hrsh7th/nvim-cmp', 
     requires = {
       'hrsh7th/cmp-nvim-lsp',
       'hrsh7th/cmp-buffer',
       'hrsh7th/cmp-path',
       'saadparwaiz1/cmp_luasnip',
     },
     config = get_config("nvim-cmp")
   }

   -- LSP for Rust
   use {'simrat39/rust-tools.nvim',
     ft = 'rust',
     config = get_config("rust-tools"),
     requires = { 
       'neovim/nvim-lspconfig',
       'nvim-lua/lsp-status.nvim',
       'hrsh7th/cmp-nvim-lsp',
     },
   }
  
   -- Snippets
   use { 'L3MON4D3/LuaSnip' }

   -- Better syntax
   use {'nvim-treesitter/nvim-treesitter',
         run = ':TSUpdate',
         config = get_config("treesitter")
   }
    use 'nvim-treesitter/nvim-treesitter-context'
   --use {'nvim-treesitter/nvim-treesitter-textobjects'}
   --use {'nvim-treesitter/playground'}
   use {'hoob3rt/lualine.nvim', 
     config = get_config("lualine")
   }

   -- DAP
   -- use {'mfussenegger/nvim-dap'}
   -- use {'nvim-telescope/telescope-dap.nvim'}
   -- use {'theHamsta/nvim-dap-virtual-text'}
  
   -- Terminal
   use {"akinsho/toggleterm.nvim",
     config = get_config("toggleterm")
   }

end)
