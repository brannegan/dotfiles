local builtin = require 'telescope.builtin'
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
}

local utils = require('utils')
utils.map('n', '<leader>ff', "<cmd>Telescope find_files<CR>")
utils.map('n', '<leader>fg', "<cmd>Telescope git_files<CR>")
utils.map('n', '<leader>rg', "<cmd>Telescope live_grep<CR>")
utils.map('n', '<leader>b',  "<cmd>Telescope buffers<CR>")
utils.map('n', '<leader>re', "<cmd>Telescope lsp_references<CR>")
utils.map('n', '<leader>sy', "<cmd>Telescope lsp_document_symbols<CR>")
utils.map('n', '<leader>q',  "<cmd>Telescope diagnostics<CR>")
