
return {
    { 'sainnhe/everforest',
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[let g:everforest_background = 'hard']])
            vim.cmd([[let g:everforest_colors_override = {'bg0': ['#1E2327', '235'] }]])
            vim.cmd([[colorscheme everforest]])
        end,
    },
    { 'tpope/vim-fugitive' },
    { 'echasnovski/mini.ai', version = false, config = true },
    { 'echasnovski/mini.pairs', version = false, config = true },
    { 'echasnovski/mini.surround', version = false, config = true },
    { 'echasnovski/mini.comment', version = false, config = true },
    { 'tversteeg/registers.nvim', config = true },
    { 'NvChad/nvim-colorizer.lua', config = true },
    { 'ellisonleao/glow.nvim', config = true, cmd = 'Glow'},
    { 'nvim-treesitter/nvim-treesitter-context',
        opts = {
            multiline_treshold=5,
        } 
    },
    { 'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        dependencies = { 'nvim-treesitter/nvim-treesitter-context' },
        opts = {
            ensure_installed = { "rust", "c", "python", "toml", "query", "lua", "markdown", "puppet" },
            highlight = { enable = true },
            indent = { enable = true },
            rainbow = { enable = true },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
    --use {'nvim-treesitter/nvim-treesitter-textobjects'}
    --use {'nvim-treesitter/playground'}

    -- DAP
    -- use {'mfussenegger/nvim-dap'}
    -- use {'nvim-telescope/telescope-dap.nvim'}
    -- use {'theHamsta/nvim-dap-virtual-text'}
}

