--local capabilities = vim.lsp.protocol.make_client_capabilities()
--capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspconfig = require('lspconfig')
local opts = {
    tools = { -- rust-tools options
        autoSetHints = true,
        hover_with_actions = true,
        inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },
    server = {
      settings = {
        ["rust-analyzer"] = {
          completion = {
            autoimport = { enable = true }
          },
          assist = {
            importMergeBehaviour = "full",
            importPrefix = "by_crate"
          },
          checkOnSave = { 
            command = "clippy" 
          },
        -- cargo = { 
        --   loadOutDirsFromCheck = true 
        -- },
        -- diagnostics = {
        --   disabled = { "unresolved-proc-macro" }
        -- }
        }
      },
      -- capabilities = capabilities,
  }
}
require('rust-tools').setup(opts)
-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
-- vim.lsp.diagnostic.on_publish_diagnostics, {
--   underline = false,
--   virtual_text = true,
--   signs = true,
--   update_in_insert = false,
-- }
-- )
local utils = require('utils')
utils.map('n', '<F1>',           '<cmd>lua vim.lsp.buf.formatting()<CR>')
utils.map('n', '<F2>',           '<cmd>lua vim.lsp.buf.rename()<CR>')
utils.map('n', 'gd',             '<cmd>lua vim.lsp.buf.definition()<CR>')
utils.map('n', 'gt',             '<cmd>lua vim.lsp.buf.type_definition()<CR>')
utils.map('n', 'ga',             '<cmd>lua vim.lsp.buf.code_action()<CR>')
utils.map('n', 'gh',             '<cmd>lua vim.lsp.buf.hover()<CR>')
utils.map('n', '<leader>i',      '<cmd>lua vim.lsp.buf.implementation()<CR>')
utils.map('n', '<leader>dn',     '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
utils.map('n', '<leader>dp',     '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
vim.cmd([[
autocmd CursorHold *.rs lua vim.lsp.diagnostic.show_line_diagnostics{focusable=false}
autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 1000)
]])
                                  
-- autocmd CursorHold,CursorHoldI *.rs :lua require'lsp_extensions'.inlay_hints{ enabled = {"TypeHint", "ChainingHint"}, prefix = '»', only_current_line = true }
--
vim.fn.sign_define("LspDiagnosticsSignError",       {text = "", numhl = "RedSign"})
vim.fn.sign_define("LspDiagnosticsSignWarning",     {text = "", numhl = "YellowSign"})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "", numhl = "BlueSign"})
vim.fn.sign_define("LspDiagnosticsSignHint",        {text = "", numhl = "AquaSign"})

