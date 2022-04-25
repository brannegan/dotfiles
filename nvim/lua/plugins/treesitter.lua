
require 'nvim-treesitter.configs'.setup {
  ensure_installed = { "rust", "c", "cpp", "python", "toml", "query", "lua" },
  highlight = {
    enable = true,
  },
  indent = { enable = true },
  rainbow = { enable = true },
}
