local lualine = require'lualine'
local utils = require 'lualine.utils.utils'
lualine.setup {
  options = {
    theme = 'gruvbox-material',
    component_separators = {left = '|', right = '|'},
  },
  -- options = {theme = 'gruvbox_dark'},
  sections = {
    lualine_a = {{'mode', lower = false}},
    lualine_b = {{'filename', path = 1}},
    lualine_c = {
      { 'diagnostics',
        icons_enabled = false,
        sources = {'nvim_lsp'},
        sections = {'error', 'warn', 'info', 'hint'},
        diagnostics_color = {
            error = { fg = utils.extract_highlight_colors("DiagnosticSignError","fg")},
            warn  = { fg = utils.extract_highlight_colors("DiagnosticSignWarn","fg")},
            info  = { fg = utils.extract_highlight_colors("DiagnosticSignInformation","fg")},
            hint  = { fg = utils.extract_highlight_colors("DiagnosticSignHint","fg")}
        },
      },
    },
    lualine_x = {
      { 'encoding' },
      { 'fileformat' }, 
      { 'filetype', colored = true, icon_only = true, },
    },
    lualine_y = {'progress'},
    lualine_z = {'location'},
  },
}
