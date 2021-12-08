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
  }
}

local utils = require('utils')
utils.map('n', '<leader>f',     "<cmd>lua require'telescope.builtin'.find_files()<CR>")
utils.map('n', '<leader>rg',    "<cmd>lua require'telescope.builtin'.live_grep()<CR>")
utils.map('n', '<leader>b',     "<cmd>lua require'telescope.builtin'.buffers()<CR>")
utils.map('n', '<leader>r',    "<cmd>lua require'telescope.builtin'.lsp_references()<CR>")
utils.map('n', '<leader>s',    "<cmd>lua require'telescope.builtin'.lsp_workspace_symbols()<CR>")
utils.map('n', '<leader>q',     "<cmd>lua require'telescope.builtin'.lsp_workspace_diagnostics()<CR>")
