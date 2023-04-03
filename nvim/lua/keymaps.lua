
vim.keymap.set('n', '<Esc>', '<cmd>noh<CR>:cclose<CR><Esc>', {silent=true})
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'gl', '$')
vim.keymap.set('n', 'gh', '^')
vim.keymap.set('n', '<SPACE>', '<nop>')
vim.keymap.set('n', '<up>', '<nop>')
vim.keymap.set('n', '<down>', '<nop>')
vim.keymap.set('n', '<left>', '<nop>')
vim.keymap.set('n', '<right>', '<nop>')
vim.keymap.set('i', '<up>', '<nop>')
vim.keymap.set('i', '<down>', '<nop>')
vim.keymap.set('i', '<left>', '<nop>')
vim.keymap.set('i', '<right>', '<nop>')
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Lsp
vim.keymap.set('n', '<leader>ru', '<cmd>RustRunnables<CR>')
vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev)
--vim.keymap.set('n', '<leader>dd', function() vim.diagnostic.open_float(nil, {scope = "line"}) end)


vim.cmd(':command! WQ wq')
vim.cmd(':command! WQ wq')
vim.cmd(':command! Wq wq')
vim.cmd(':command! Wqa wqa')
vim.cmd(':command! W w')
vim.cmd(':command! Q q')          
