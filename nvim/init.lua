-- Auto install packer.nvim if not exists
local fn = vim.fn
local execute = vim.api.nvim_command
local autocmd = vim.api.nvim_create_autocmd
local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim ' ..
                install_path)
end
vim.cmd [[packadd packer.nvim]]
-- Recompile packer on write
autocmd("BufWritePost", {pattern = "use.lua", callback = function() require'packer'.compile() end})

-- Sensible defaults
require('options')

-- Install plugins
require('use')

-- Key mappings
require('keymaps')

-- Colorscheme
require('colorscheme')

-- DAP
-- require('dbg')

