local actions = require 'telescope.actions'
local previewers = require 'telescope.previewers'
local builtin = require 'telescope.builtin'

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

vim.keymap.set('n', '<leader>ff', builtin.find_files)
vim.keymap.set('n', '<leader>fg', builtin.git_files)
vim.keymap.set('n', '<leader>rg', builtin.live_grep)
vim.keymap.set('n', '<leader>b',  builtin.buffers)
vim.keymap.set('n', '<leader>re', builtin.lsp_references)
vim.keymap.set('n', '<leader>sy', builtin.lsp_document_symbols)
vim.keymap.set('n', '<leader>q',  builtin.diagnostics)
