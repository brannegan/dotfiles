local lualine = require'lualine'
lualine.setup {
  options = {theme = 'gruvbox-material'},
  sections = {
    lualine_a = {{'mode', lower = false}},
    lualine_b = {{'filename', path = 2}},
    lualine_c = {{'diagnostics',
      sources = {'nvim_lsp'},
      sections = {'error', 'warn', 'info', 'hint'},
      -- all colors are in format #rrggbb
      color_error = '#ea6962',-- changes diagnostic's error foreground color
      color_warn  = '#d8a657',-- changes diagnostic's warn foreground color
      color_info  = '#7daea3',-- Changes diagnostic's info foreground color
      color_hint  = '#89b482',-- Changes diagnostic's hint foreground color
      --symbols = {error = 'E', warn = 'W', info = 'I', hint = 'H'}
    }},
    lualine_x = {'encoding'},
    lualine_y = {'filetype'},
    lualine_z = {'location'}
  }
}
