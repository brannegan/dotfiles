local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lsp_status = require('lsp-status')
lsp_status.register_progress()
capabilities = vim.tbl_extend('keep', capabilities or {}, lsp_status.capabilities)

local opts = {
  tools = { -- rust-tools options
      autoSetHints = true,
      hover_with_actions = false,
      inlay_hints = {
        only_current_line = true,
        only_current_line_autocmd = "CursorHold",
        show_variable_name = false,
        show_parameter_hints = false,
        parameter_hints_prefix = "•",
        other_hints_prefix = "»",
        highlight = "Comment",
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
            allFeatures = true
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

vim.api.nvim_create_autocmd("BufWritePre ", {
  pattern = "*.rs",
  callback = function() vim.lsp.buf.formatting_sync(nil, 1000) end
})

vim.fn.sign_define("DiagnosticSignError", {text = "E:", numhl = "RedSign"})
vim.fn.sign_define("DiagnosticSignWarn",  {text = "W:", numhl = "YellowSign"})
vim.fn.sign_define("DiagnosticSignInfo",  {text = "I:", numhl = "BlueSign"})
vim.fn.sign_define("DiagnosticSignHint",  {text = "H:", numhl = "AquaSign"})

