local utils = require('utils')

utils.map('n', '<Esc>', '<cmd>noh<CR>:cclose<CR><Esc>', {silent=true})
utils.map('n', 'Y', 'y$')
utils.map('n', 'k', 'gk')
utils.map('n', 'j', 'gj')
utils.map('n', '<SPACE>', '<nop>')
utils.map('n', '<up>', '<nop>')
utils.map('n', '<down>', '<nop>')
utils.map('n', '<left>', '<nop>')
utils.map('n', '<right>', '<nop>')
--utils.map('i', '<SPACE>', '<nop>')
utils.map('i', '<up>', '<nop>')
utils.map('i', '<down>', '<nop>')
utils.map('i', '<left>', '<nop>')
utils.map('i', '<right>', '<nop>')

                                  
