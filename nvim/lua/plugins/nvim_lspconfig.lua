
--local capabilities = vim.lsp.protocol.make_client_capabilities()
--capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

return { 
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { 
        'nvim-telescope/telescope.nvim',
--        "hrsh7th/cmp-nvim-lsp",
        { "https://git.sr.ht/~whynothugo/lsp_lines.nvim", 
           config = true,
           keys = {
               { "<leader>dd", 
                 "<cmd>lua require('lsp_lines').toggle()<CR>", 
                 desc = "Toggle lsp_lines" }
           }
        },
        { "j-hui/fidget.nvim", config = true },
    },
    keys = {
--        { "<F2>",       vim.lsp.buf.rename,            desc ="LSP rename"},
        { "gd",         vim.lsp.buf.definition,        desc ="vim.lsp.buf.definition" },
--        { "gt",         vim.lsp.buf.type_definition,   desc ="LSP type definition" },
--        { "<leader>a",  vim.lsp.buf.code_action,       desc ="LSP code action" },
--        { "<leader>aa", vim.lsp.buf.range_code_action, desc ="LSP range code action" },
        { "grf", vim.lsp.buf.format,            desc ="vim.lsp.buf.format" },
        { "grh", ":lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>",
                                                       desc ="LSP inlay hints toggle" },
    },
    config = function()
        vim.lsp.config("rust_analyzer",{
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
                        enable = true,
                        command = "clippy" 
                    },
                }
            }
        })
        vim.lsp.enable("rust_analyzer")
    end,
}
