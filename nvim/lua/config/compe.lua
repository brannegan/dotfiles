
require('compe').setup {
  enabled = true,
  autocomplete = true,
  min_length = 1,
  preselect = 'enabled',
  throttle_time = 80,
  source_timeout = 200,
  incomplete_delay = 400,
  max_abbr_width = 100,
  max_kind_width = 100,
  max_menu_width = 100,
  --documentation = true,
  documentation = {
    border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  },
  source = {
    path = true,
    nvim_lsp = true,
    nvim_lua = true,
    buffer = true,
    calc = {
      priority = 100,
    },
    --treesitter = true,
  },
}
local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
-- move to prev/next item in completion menuone
-- jump to prev/next snippet's placeholder
_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-n>"
    elseif vim.fn.call("vsnip#available", {1}) == 1 then
        return t "<Plug>(vsnip-expand-or-jump)"
    elseif check_back_space() then
        return t "<Tab>"
    else
        return vim.fn['compe#complete']()
    end
end
_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-p>"
    elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
        return t "<Plug>(vsnip-jump-prev)"
    else
        return t "<S-Tab>"
    end
end

local utils = require('utils')
utils.map('i', '<Tab>', 'v:lua.tab_complete()', {silent=true, expr=true})
utils.map('i', '<S-Tab>', '<C-p>',              {silent=true}           )
utils.map('i', '<CR>', "compe#confirm('<CR>')", {silent=true, expr=true})
utils.map('i', '<C-e>', "compe#close('<C-e>')", {silent=true, expr=true})
