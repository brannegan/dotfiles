
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

return { 
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { 
        "hrsh7th/cmp-nvim-lsp",
        { "https://git.sr.ht/~whynothugo/lsp_lines.nvim", 
           config = true,
           keys = {
               { "<leader>d", 
                 "<cmd>lua require('lsp_lines').toggle()<CR>", 
                 desc = "Toggle lsp_lines" }
           }
        },
        { "j-hui/fidget.nvim", config = true },
    },
    keys = {
        { "<F1>",       vim.lsp.buf.formatting,        desc ="LSP formatting" },
        { "<F2>",       vim.lsp.buf.rename,            desc ="LSP rename"},
        { "gd",         vim.lsp.buf.definition,        desc ="LSP definition" },
        { "gt",         vim.lsp.buf.type_definition,   desc ="LSP type definition" },
        { "<leader>a",  vim.lsp.buf.code_action,       desc ="LSP code action" },
        { "<leader>re", vim.lsp.buf.references,       desc ="LSP references" },
        { "<leader>aa", vim.lsp.buf.range_code_action, desc ="LSP range code action" },
        { "<leader>h",  vim.lsp.buf.hover,             desc ="LSP hover" },
    },
    config = function()
        local lspconfig = require("lspconfig")
        lspconfig["rust_analyzer"].setup({
            capabilities = capabilities,
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
                }
            }
        })
    end,
}
