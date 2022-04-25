-- Map leader to space

local fn = vim.fn
local execute = vim.api.nvim_command
local autocmd = vim.api.nvim_create_autocmd

-- Sensible defaults
require('options')

-- Auto install packer.nvim if not exists
local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim ' ..
                install_path)
end
vim.cmd [[packadd packer.nvim]]
autocmd("BufWritePost", { pattern = "use.lua", callback = require'packer'.compile })

-- Install plugins
require('use')

-- Key mappings
require('keymaps')

-- LSP
require('lsp')

-- Colorscheme
require('colorscheme')

-- DAP
-- require('dbg')

