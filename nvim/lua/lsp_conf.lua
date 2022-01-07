local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lsp_status = require('lsp-status')
lsp_status.register_progress()
capabilities = vim.tbl_extend('keep', capabilities or {}, lsp_status.capabilities)

local opts = {
  tools = { -- rust-tools options
      autoSetHints = true,
      hover_with_actions = false,
      --runnables = true,
      inlay_hints = {
        only_current_line = true,
        show_parameter_hints = true,
        parameter_hints_prefix = "",
        other_hints_prefix = "»",
      },
  },
  server = {
    settings = {
      ["rust-analyzer"] = {
        assist = {
            importGranularity = "module",
            importPrefix = "by_self",
        },
        cargo = {
            loadOutDirsFromCheck = true
        },
        procMacro = {
            enable = true
        },
        checkOnSave = { 
          command = "clippy" 
        },
        -- diagnostics = {
        --   disabled = { "unresolved-proc-macro" }
        -- }
      }
    },
    capabilities = capabilities,
  }
}
require('rust-tools').setup(opts)
local utils = require('utils')
utils.map('n', '<F1>',           '<cmd>lua vim.lsp.buf.formatting()<CR>')
utils.map('n', '<F2>',           '<cmd>lua vim.lsp.buf.rename()<CR>')
utils.map('n', 'gd',             '<cmd>lua vim.lsp.buf.definition()<CR>')
utils.map('n', 'gt',             '<cmd>lua vim.lsp.buf.type_definition()<CR>')
utils.map('n', '<leader>a',      '<cmd>lua vim.lsp.buf.code_action()<CR>')
utils.map('n', '<leader>h',      '<cmd>lua vim.lsp.buf.hover()<CR>')
utils.map('n', '<leader>i',      '<cmd>lua vim.lsp.buf.implementation()<CR>')
utils.map('n', '<leader>dn',     '<cmd>lua vim.diagnostic.goto_next()<CR>')
utils.map('n', '<leader>dp',     '<cmd>lua vim.diagnostic.goto_prev()<CR>')
utils.map('n', '<leader>dd',     '<cmd>lua vim.diagnostic.open_float(nil, {scope = "line"})<CR>')
vim.cmd([[
autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 1000)
]])

vim.fn.sign_define("DiagnosticSignError", {text = "E:", numhl = "RedSign"})
vim.fn.sign_define("DiagnosticSignWarn",  {text = "W:", numhl = "YellowSign"})
vim.fn.sign_define("DiagnosticSignInfo",  {text = "I:", numhl = "BlueSign"})
vim.fn.sign_define("DiagnosticSignHint",  {text = "H:", numhl = "AquaSign"})

