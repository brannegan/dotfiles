local lualine = require'lualine'
local utils = require 'lualine.utils.utils'
local colors = {
  error = utils.extract_highlight_colors("DiagnosticSignError","fg"),
  warn  = utils.extract_highlight_colors("DiagnosticSignWarn","fg"),
  info  = utils.extract_highlight_colors("DiagnosticSignInfo","fg"),
  hint  = utils.extract_highlight_colors("DiagnosticSignHint","fg"),
}
lualine.setup {
  options = {
    theme = 'everforest',
    component_separators = {left = '|', right = '|'},
    globalstatus = true,
  },
  -- options = {theme = 'gruvbox_dark'},
  sections = {
    lualine_a = {{'mode', lower = false}},
    lualine_b = {{'filename', path = 1}},
    lualine_c = {
      { 'diagnostics',
        icons_enabled = false,
        sources = {'nvim_diagnostic'},
        sections = {'error', 'warn', 'info', 'hint'},
        diagnostics_color = {
            error = { fg = colors.error },
            warn  = { fg = colors.warn },
            info  = { fg = colors.info },
            hint  = { fg = colors.hint },
        },
      },
      { "require'lsp-status'.status_progress()",
        color = { fg = colors.info },
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
