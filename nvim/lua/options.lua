
local o = vim.opt
local cmd = vim.cmd

cmd 'syntax enable'
cmd 'filetype plugin indent on'

o.shiftwidth = 2
o.tabstop = 2
o.softtabstop = 2
o.termguicolors = true
o.hidden = true
o.ignorecase = true
o.smartcase = true
o.clipboard = 'unnamed,unnamedplus'
o.timeoutlen = 500
o.updatetime = 300
o.colorcolumn = {100}
o.signcolumn = "no"
--o.cmdheight = 2
o.number = true
o.relativenumber = true
o.scrolloff = 8
o.cursorline = true
o.splitbelow = true
o.splitright = true
o.title = true
o.showmode = false
o.completeopt = "menuone,noselect"
o.foldmethod = "indent"
o.foldenable = false
o.laststatus=3
vim.g.mapleader = ' '

cmd [[
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
]]

-- Highlight on yank
-- cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'
cmd 'au TextYankPost * silent! lua vim.highlight.on_yank()'

