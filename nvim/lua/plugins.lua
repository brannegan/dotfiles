return require('packer').startup(function()

    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}

    -- Development
    --use {'tpope/vim-fugitive'}
    use {'tpope/vim-surround'}
    use {'tpope/vim-repeat'}
    -- use {'wellle/targets.vim'}
    -- use {'sindrets/diffview.nvim'}
    -- use {'jiangmiao/auto-pairs'}
    -- use {'norcalli/nvim-colorizer.lua'}
    use {'windwp/nvim-autopairs'}

    -- Color scheme
    use {'kyazdani42/nvim-web-devicons'}
    use {'sainnhe/gruvbox-material'}

    -- Telescope
    use {'nvim-lua/plenary.nvim'}
    use {'nvim-lua/popup.nvim'}
    use {'nvim-telescope/telescope.nvim'}

    -- LSP config
    use {'neovim/nvim-lspconfig'}
    -- use {'nvim-lua/lsp_extensions.nvim'}
    use {'nvim-lua/lsp-status.nvim'}

    -- Completion - use either one of this
    use {'hrsh7th/nvim-cmp'}
    use {'hrsh7th/cmp-nvim-lsp'}
    use {'hrsh7th/cmp-buffer'}
    use {'hrsh7th/cmp-path'} 
    use {'saadparwaiz1/cmp_luasnip'}
    -- {'hrsh7th/cmp-cmdline', after = 'nvim-cmp'}, 
    -- Snippets
    use { 'L3MON4D3/LuaSnip' }

    -- Better syntax
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    --use {'nvim-treesitter/nvim-treesitter-textobjects'}
    --use {'nvim-treesitter/playground'}

    use {'hoob3rt/lualine.nvim'}

    -- DAP
    -- use {'mfussenegger/nvim-dap'}
    -- use {'nvim-telescope/telescope-dap.nvim'}
    -- use {'theHamsta/nvim-dap-virtual-text'}

    -- Rust
    use {'simrat39/rust-tools.nvim'}

    -- use {'oberblastmeister/neuron.nvim' }

end)
