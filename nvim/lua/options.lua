vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.termguicolors = true
vim.opt.hidden = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.clipboard = 'unnamed'
vim.opt.timeoutlen = 500
vim.opt.updatetime = 300
vim.opt.colorcolumn = {100}
vim.opt.signcolumn = "yes"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.cursorline = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.title = true
vim.opt.showmode = false
vim.opt.completeopt = "menuone,noselect"
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99
vim.opt.laststatus = 3
vim.opt.cmdheight = 0
vim.g.mapleader = ' '

vim.cmd [[
set expandtab smarttab shiftround autoindent smartindent smartcase
set path+=**
set wildmode=longest,list,full
set wildmenu
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*
syntax enable
filetype plugin indent on
au TextYankPost * silent! lua vim.highlight.on_yank()
highlight! link VirtualTextWarning WarningFloat
highlight! link VirtualTextError ErrorFloat
highlight! link VirtualTextInfo InfoFloat
highlight! link VirtualTextHint HintFloat
]]

vim.fn.sign_define("DiagnosticSignError", {text = "E:", numhl = "RedSign"})
vim.fn.sign_define("DiagnosticSignWarn",  {text = "W:", numhl = "YellowSign"})
vim.fn.sign_define("DiagnosticSignInfo",  {text = "I:", numhl = "BlueSign"})
vim.fn.sign_define("DiagnosticSignHint",  {text = "H:", numhl = "AquaSign"})

vim.diagnostic.config({ virtual_text = false })

vim.api.nvim_create_autocmd({'BufNewfile', 'BufRead'}, {pattern = '*.wgsl', command = 'set filetype=wgsl'})
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'wgsl',
  callback = function()
    vim.lsp.start({
      name = 'wgsl-analyzer',
      cmd = {'wgsl_analyzer'}
    })
  end,
})

