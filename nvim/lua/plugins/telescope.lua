return { 'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/popup.nvim',
        'nvim-lua/plenary.nvim',
        'kyazdani42/nvim-web-devicons',
        'nvim-telescope/telescope-ui-select.nvim',
    },
    keys = {
        {'<leader>ff', "<cmd>Telescope find_files<CR>", desc = "Telescope"},
        {'<leader>fg', "<cmd>Telescope git_files<CR>", desc = "Telescope"},
        {'<leader>rg', "<cmd>Telescope live_grep<CR>", desc = "Telescope"},
        {'<leader>b',  "<cmd>Telescope buffers<CR>", desc = "Telescope"},
        {'<leader>re', "<cmd>Telescope lsp_references<CR>", desc = "Telescope"},
        {'<leader>i',  "<cmd>Telescope lsp_implementations<CR>", desc = "Telescope"},
        {'<leader>sy', "<cmd>Telescope lsp_document_symbols<CR>", desc = "Telescope"},
        {'<leader>d',  "<cmd>Telescope diagnostics<CR>", desc = "Telescope"},
    },
    config = function()
        local actions = require 'telescope.actions'
        local previewers = require 'telescope.previewers'

        require('telescope').setup {
            defaults = {
                mappings = {
                    i = {
                        ["<c-j>"] = actions.move_selection_next,
                        ["<c-k>"] = actions.move_selection_previous,
                    },
                },
                file_ignore_patterns = {"target/*"},
                file_previewer = previewers.vim_buffer_cat.new,
                grep_previewer = previewers.vim_buffer_vimgrep.new,
                qflist_previewer = previewers.vim_buffer_qflist.new
            },
            pickers = {
                find_files = {
                    no_ignore = true,
                }
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

