--function get_config(name)
--    return string.format('require("plugins/%s")', name)
--end

return {
    -- Color scheme
    { 'sainnhe/everforest',
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[let g:everforest_background = 'hard']])
            vim.cmd([[let g:everforest_colors_override = {'bg0': ['#1E2327', '235'] }]])
            vim.cmd([[colorscheme everforest]])
        end,
    },
    { 'tpope/vim-surround'},
    { 'tpope/vim-repeat'},
    { 'windwp/nvim-autopairs', config = true },
    { 'tversteeg/registers.nvim', config = true },
    { 'NvChad/nvim-colorizer.lua', config = true },
    -- Completion - use either one of this
    -- Snippets
    { 'L3MON4D3/LuaSnip' },
    -- Better syntax
    { 'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        dependencies = { 'nvim-treesitter/nvim-treesitter-context' },
        opts = {
            ensure_installed = { "rust", "c", "cpp", "python", "toml", "query", "lua" },
            highlight = {
                enable = true,
            },
            indent = { enable = true },
            rainbow = { enable = true },
        }
    },
    --use {'nvim-treesitter/nvim-treesitter-textobjects'}
    --use {'nvim-treesitter/playground'}

    -- DAP
    -- use {'mfussenegger/nvim-dap'}
    -- use {'nvim-telescope/telescope-dap.nvim'}
    -- use {'theHamsta/nvim-dap-virtual-text'}
}
