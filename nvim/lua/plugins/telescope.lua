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

