return { 'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/popup.nvim',
        'nvim-lua/plenary.nvim',
        'kyazdani42/nvim-web-devicons',
        'nvim-telescope/telescope-ui-select.nvim',
    },
    keys = {
        {'<leader>ff', "<cmd>Telescope find_files<CR>", desc = "Telescope find files"},
        {'<leader>fg', "<cmd>Telescope git_files<CR>", desc = "Telescope git files"},
        {'<leader>rg', "<cmd>Telescope live_grep<CR>", desc = "Telescope live grep"},
        {'<leader>b',  "<cmd>Telescope buffers<CR>", desc = "Telescope buffers"},
        {'<leader>re', "<cmd>Telescope lsp_references<CR>", desc = "Telescope lsp references"},
        {'<leader>im', "<cmd>Telescope lsp_implementations<CR>", desc = "Telescope lsp impls"},
        {'<leader>sy', "<cmd>Telescope lsp_document_symbols<CR>", desc = "Telescope lsp doc symbols"},
        {'<leader>d',  "<cmd>Telescope diagnostics<CR>", desc = "Telescope diagnostics"},
    },
    config = function()
        require('telescope').setup {
            defaults = {
                file_ignore_patterns = {"target/*"},
            },
            pickers = {
                find_files           = { theme = "ivy", layout_config = { height = 0.4 } },
                live_grep            = { theme = "ivy", layout_config = { height = 0.4 } },
                git_files            = { theme = "ivy", layout_config = { height = 0.4 } },
                lsp_references       = { theme = "ivy", layout_config = { height = 0.4 } },
                lsp_implementations  = { theme = "ivy", layout_config = { height = 0.4 } },
                lsp_document_symbols = { theme = "ivy", layout_config = { height = 0.4 } },
                diagnostics          = { theme = "ivy", layout_config = { height = 0.4 } }
            },
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown({}),
                }
            },
        }
        require("telescope").load_extension("ui-select")
    end
}

